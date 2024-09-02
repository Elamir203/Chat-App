import 'package:chat_app/Models/message_model.dart';
import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Widgets/custom_chat_bubble.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  static String id = 'ChatScreen';
  CollectionReference messages =
  FirebaseFirestore.instance.collection(kMessagesCollection);
  TextEditingController controller = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy(kMessageTime, descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MessageModel> messagesList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagesList.add(MessageModel.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
              appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: kPrimaryColor,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        kLogo,
                        height: 60,
                      ),
                      const Text(
                        'Chat',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  )),
              body: Column(
                children: [
                  Expanded(
                    child: messagesList.isNotEmpty
                        ? ListView.builder(
                      reverse: true,
                      itemCount: messagesList.length,
                      itemBuilder: (context, index) {
                        return messagesList[index].id == email
                            ? MyChatBubble(
                          message: messagesList[index],
                        )
                            : OthersChatBubble(
                            message: messagesList[index]);
                      },
                      controller:
                      scrollController, // Assign the scroll controller here
                    )
                        : Center(child: Text('No messages')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      controller: controller,
                      onSubmitted: (text) {
                        messages.add({
                          kMessage: text,
                          kMessageTime: DateTime.now(),
                          kUniqueId: email,
                        });
                        controller.clear();
                        scrollController.animateTo(
                          0,
                          duration: Duration(seconds: 1),
                          curve: Curves.easeIn,
                        );
                      },
                      decoration: InputDecoration(
                        hintText: 'Message',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            if (controller.text.isNotEmpty) {
                              messages.add({
                                kMessage: controller.text,
                                kMessageTime: DateTime.now(),
                                kUniqueId: email,
                              });
                              controller.clear();
                              scrollController.animateTo(
                                0,
                                duration: Duration(seconds: 1),
                                curve: Curves.easeIn,
                              );
                            }
                          },
                          child: Icon(
                            Icons.send,
                            color: kPrimaryColor,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: kPrimaryColor,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}