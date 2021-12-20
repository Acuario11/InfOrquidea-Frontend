
import 'package:flutter/material.dart';
import 'package:login_inforquidea/models/auth.dart';
import 'package:login_inforquidea/pages/profile_page.dart';
import 'package:login_inforquidea/pages/widgets/header_widget.dart';
import 'package:login_inforquidea/providers/auth.dart';
import 'package:login_inforquidea/temas/theme_helper.dart';

import 'home/homepubgeneral.dart';

import 'dart:typed_data';
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:login_inforquidea/providers/image.dart';

class RegistrationPage extends StatefulWidget{
  //const RegistrationPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage>{

  String rutaImagen =
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png";
  String imagenCargada = "";

//Formkey
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final picker = ImagePicker();

  _imagenSeleccion(String imgsel) async {

    final base64Img = await File(imgsel).readAsBytesSync().toString();
    Uint8List bytesList = base64Decode(base64Img);
    Image img = Image.memory(base64Decode(base64Img));
    return img.image;
    //return MemoryImage(bytesList);
  }

  String nombre = "";
  String apellido = "";
  String celular = "";

  String usuario = "";
  String clave = "";

  bool checkedValue = false;
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {

    final imgsel = Provider.of<ImagenSeleccion>(context).getimg;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 150,
              child: const HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              abrirSeleccionOrigen();

                            },
                            child: Text("Tomar Foto")),

                        //image: NetworkImage(imagenCargada)
                        //image: (imagenCargada.isNotEmpty)? _imagenSeleccion() : NetworkImage(imagenCargada)

                        Container(
                            margin:
                            EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: (imgsel.isNotEmpty)? Image.file(
                                File(imgsel),
                                fit: BoxFit.cover
                            ) : Container()
                        ),
                        //imagen == null ? Container() : Image.file(imagen),
                        const Text(
                          "Foto del Usuario",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          Provider.of<ImagenSeleccion>(context).getimg,
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 30,),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration('Nombres', 'Ingrese sus nombres'),
                            onSaved: (value) {
                              nombre = value!;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20,),
                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration('Apellidos', 'Ingrese sus apellidos'),
                            onSaved: (value){
                              apellido = value!;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20.0),

                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration(
                                "Celular",
                                "Ingresa tú número de celular"),
                            onSaved: (value){
                              celular = value!;
                            },
                            keyboardType: TextInputType.phone,
                            validator: (val) {
                              if(!(val!.isEmpty) && !RegExp(r"^(\d+)*$").hasMatch(val)){
                                return "Enter a valid phone number";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20.0),

                        Container(
                          child: TextFormField(
                            decoration: ThemeHelper().textInputDecoration('Usuario', 'Ingresa tu usuario'),
                            onSaved: (value) {
                              usuario = value!;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 20.0),

                        Container(
                          child: TextFormField(
                            obscureText: true,
                            decoration: ThemeHelper().textInputDecoration(
                                "Contraseña", "Ingresa tu contraseña"),
                            onSaved: (value){
                              clave = value!;
                            },
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please enter your password";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        const SizedBox(height: 15.0),
                        FormField<bool>(
                          builder: (state) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                        value: checkboxValue,
                                        onChanged: (value) {
                                          setState(() {
                                            checkboxValue = value!;
                                            state.didChange(value);
                                          });
                                        }),
                                    Text("I accept all terms and conditions.", style: TextStyle(color: Colors.grey),),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.errorText ?? '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(color: Theme.of(context).errorColor,fontSize: 12,),
                                  ),
                                )
                              ],
                            );
                          },
                          validator: (value) {
                            if (!checkboxValue) {
                              return 'You need to accept terms and conditions';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "Register".toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();

                                guardarUsurioP();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  guardarUsurioP() async{
    PersonaModel pm = PersonaModel.fromValues("", "fotop.png", nombre, apellido, celular, "1");
    AuthProvider ap = AuthProvider();
    PersonaCreateResponse pcr = await ap.crearPersona(pm);

    //final String image = Provider.of<>(context)
    final String imgsel = Provider.of<ImagenSeleccion>(context, listen: false).getimg;
    //await Future.delayed(Duration(seconds: 2));
    await subirImagen(File(imgsel), pcr.persona.id);

    UsuarioModel um = UsuarioModel.fromValues("", usuario, clave, pcr.persona.id, "1");
    UsuarioCreateResponse ucr = await ap.crearUsuario(um);

    UsuRolModel urm = UsuRolModel.fromValues("", ucr.usuario.id, "61a67c2f84750e4ed21eefba", "1");
    UsuRolCreateResponse urcr = await ap.crearUsuRol(urm);

    print("USUROL ${urm.usuarioId}");

    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePubGeneral()));
  }
  //IMAGE

  void obtenerImagen(ImageSource source) async {
    File image;

    var picture = await ImagePicker.platform.pickImage(source: source);
    if (picture != null) {
      image = File(picture.path);
      print("asd: ${picture.path}");
      Provider.of<ImagenSeleccion>(context, listen: false).setimg = picture.path;

      //ImageResponse ir = await subirImagen(image);
      imagenCargada=picture.path;
      //this.imagenCargada = ir.Result;
      print("=========================================================================");
      /*if (imagenCargada != '') {
        setState(() {
          this.rutaImagen = imagenCargada;
          this.imagenCargada = '';
        });
      }*/
    }
  }

  Future<ImageResponse> subirImagen(File image, String idpublico) async {
    var request = http.MultipartRequest(
      //"POST", Uri.parse("http://10.0.2.2:8283/image/upload"));
        "POST", Uri.parse("http://10.0.2.2:8283/api/image/uploadPublico/$idpublico/")
      //"POST", Uri.parse("http://10.0.2.2:8283/api/image/upload/61beba9c84b748861c7323e9 )")

    );
    //localhost:8283/api/image/upload/61b95867ab2e34166ffc2a99/

    var picture = await http.MultipartFile.fromPath("photo", image.path);
    request.files.add(picture);
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    String rawResponse = utf8.decode(responseData);
    var jsonResponse = jsonDecode(rawResponse);
    print(rawResponse);
    ImageResponse ir = ImageResponse(jsonResponse);
    return ir;
  }

  Future<void> abrirSeleccionOrigen() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: (){
                      obtenerImagen(ImageSource.camera);
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(width: 1, color: Colors.grey))
                      ),
                      child: Row(
                        children: const [
                          Expanded(
                            child: Text('Tomar una foto', style: TextStyle( fontSize: 16),),
                          ),
                          Icon(Icons.camera_alt, color: Colors.blue)
                        ],
                      ),

                    ),
                  ),
                  InkWell(
                    onTap: (){
                      obtenerImagen(ImageSource.gallery);
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: const [
                          Expanded(
                            child: Text('Seleccionar una foto', style: TextStyle( fontSize: 16),),
                          ),
                          Icon(Icons.image_search_sharp, color: Colors.blue)
                        ],
                      ),

                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.red
                      ),
                      child: Row(
                        children: const [
                          Expanded(
                            child: Text('Cancelar', style: TextStyle( fontSize: 16, color: Colors.white),
                              textAlign: TextAlign.center,),
                          ),
                          Icon(Icons.cancel, color: Colors.white)
                        ],
                      ),

                    ),
                  ),
                ],
              ),

            ),);
        });
  }

}

class ImageResponse {
  String Result = '';
  ImageResponse(Map jsonResponse) {
    this.Result = jsonResponse["Result"];
  }


}