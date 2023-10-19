import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsapp/core/services/network/network_request.dart';
import 'package:newsapp/core/services/validation-service.dart';
import 'package:newsapp/features/news_search/controller/search_controller.dart';
import 'package:newsapp/features/news_search/models/article_model.dart';
import 'package:newsapp/features/news_search/screens/list_articles_screen.dart';
import 'package:newsapp/widgets/app_bars/text_app_bar.dart';
import 'package:newsapp/widgets/forms/CustomTextField.dart';
import 'package:newsapp/widgets/forms/text_button.dart';

class ContentSearchScreen extends StatelessWidget {
   ContentSearchScreen({Key? key}) : super(key: key);

  final NewsController controller = NewsController();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController(text: "apple");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomTextAppBar(
        title: "Search",
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [

              //Main Content
              SingleChildScrollView(
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: CustomOutlineInputBox(
                        label: "",
                        hintText: "Search News",
                        controller: _textEditingController,
                        prefixIcon: IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: (){},
                          icon: SvgPicture.asset('assets/svgs/search.svg',
                            width: 21,
                          ),
                        ),
                        validator: ValidationService().isValidString,
                        autofocus: true,
                      ),
                    )
                  ],
                ),
              ),

              //Search Button
              Positioned(
                bottom: 30,
                left: 10,
                right: 10,
                child: StreamBuilder<NetworkRequestStatus>(
                  stream: controller.getNewsRequest.statusStream,
                  builder: (context, snapshot) {
                    return CustomTextButton(
                      onTap: snapshot.data == NetworkRequestStatus.pending ? null:(){
                        _submit(context);
                      },
                      label: "Search",
                      isLoading: snapshot.data == NetworkRequestStatus.pending,
                    );
                  }
                )
              )
            ],
          ),
        ),
      ),
    );
  }

  void _submit(BuildContext context)async {
    //Validate form
    if(!_formKey.currentState!.validate()) return;

    FocusScope.of(context).unfocus();
    String query = _textEditingController.text;
    List<ArticleModel>? articles = await controller.getNews('$query&pageSize=20');

    Navigator.of(context).push(
        MaterialPageRoute(builder: (context)=> ListArticlesScreen(
          query: query,
          data: articles ?? [],
        )));
  }
}
