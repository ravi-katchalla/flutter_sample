import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/vivek_official/chat_sample_app/chat_model.dart';
import 'package:flutter_sample/vivek_official/chat_sample_app/message_model.dart';
import 'package:flutter_sample/vivek_official/chat_sample_app/own_message_card.dart';
import 'package:flutter_sample/vivek_official/chat_sample_app/reply_card.dart';
import 'package:flutter_svg/svg.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key}) : super(key: key);
  final ChatModel chatModel = ChatModel(
    name: "Vivek",
    isGroup: false,
    currentMessage: "Hey",
    time: "4:00",
    icon: "svg_sample.svg",
    id: 1,
  );
  final ChatModel sourchat = ChatModel(
    name: "Insan",
    isGroup: false,
    currentMessage: "Hi",
    time: "5:00",
    icon: "svg_sample.svg",
    id: 2,
  );

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  bool sendButton = false;
  List<MessageModel> messages = [];
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late IO.Socket socket;
  @override
  void initState() {
    super.initState();
    // connect();

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
    connect();
  }

  void connect() {
    // MessageModel messageModel = MessageModel(sourceId: widget.sourceChat.id.toString(),targetId: );
    socket = IO.io("http://192.168.190.76:8000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    socket.emit("signin", widget.sourchat.id);
    socket.onConnect((data) {
      print("Connected");
      socket.on("message", (msg) {
        print(msg);
        setMessage("destination", msg["message"]);
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300), curve: Curves.easeOut);
      });
    });
    print(socket.connected);
  }

  void sendMessage(String message, int sourceId, int targetId) {
    setMessage("source", message);
    socket.emit("message",
        {"message": message, "sourceId": sourceId, "targetId": targetId});
  }

  void setMessage(String type, String message) {
    MessageModel messageModel = MessageModel(
        type: type,
        message: message,
        time: DateTime.now().toString().substring(10, 16));
    print(messages);

    setState(() {
      messages.add(messageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image.asset(
        //   "assets/whatsapp_Back.png",
        //   height: MediaQuery.of(context).size.height,
        //   width: MediaQuery.of(context).size.width,
        //   fit: BoxFit.cover,
        // ),
        Scaffold(
          backgroundColor: Colors.grey,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBar(
              leadingWidth: 70,
              titleSpacing: 0,
              // leading: InkWell(
              //   onTap: () {
              //     // Navigator.pop(context);
              //   },
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       // Icon(
              //       //   Icons.arrow_back,
              //       //   size: 24,
              //       // ),
              //       CircleAvatar(
              //         child: SvgPicture.asset(
              //           widget.chatModel.isGroup
              //               ? "assets/groups.svg"
              //               : "assets/svg_sample.svg",
              //           color: Colors.white,
              //           height: 36,
              //           width: 36,
              //         ),
              //         radius: 20,
              //         backgroundColor: Colors.blueGrey,
              //       ),
              //     ],
              //   ),
              // ),
              title: InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.all(6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.chatModel.name,
                        style: const TextStyle(
                          fontSize: 18.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Text(
                      //   "last seen today at 12:05",
                      //   style: TextStyle(
                      //     fontSize: 13,
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
              // actions: [
              //   IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
              //   IconButton(icon: Icon(Icons.call), onPressed: () {}),
              //   PopupMenuButton<String>(
              //     padding: EdgeInsets.all(0),
              //     onSelected: (value) {
              //       print(value);
              //     },
              //     itemBuilder: (BuildContext contesxt) {
              //       return [
              //         PopupMenuItem(
              //           child: Text("View Contact"),
              //           value: "View Contact",
              //         ),
              //         PopupMenuItem(
              //           child: Text("Media, links, and docs"),
              //           value: "Media, links, and docs",
              //         ),
              //         PopupMenuItem(
              //           child: Text("Whatsapp Web"),
              //           value: "Whatsapp Web",
              //         ),
              //         PopupMenuItem(
              //           child: Text("Search"),
              //           value: "Search",
              //         ),
              //         PopupMenuItem(
              //           child: Text("Mute Notification"),
              //           value: "Mute Notification",
              //         ),
              //         PopupMenuItem(
              //           child: Text("Wallpaper"),
              //           value: "Wallpaper",
              //         ),
              //       ];
              //     },
              //   ),
              // ],
            ),
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: WillPopScope(
              child: Column(
                children: [
                  Expanded(
                    // height: MediaQuery.of(context).size.height - 150,
                    child: ListView.builder(
                      shrinkWrap: true,
                      controller: _scrollController,
                      itemCount: messages.length + 1,
                      itemBuilder: (context, index) {
                        if (index == messages.length) {
                          return Container(
                            height: 70,
                          );
                        }
                        if (messages[index].type == "source") {
                          return OwnMessageCard(
                            message: messages[index].message,
                            time: messages[index].time,
                          );
                        } else {
                          return ReplyCard(
                            message: messages[index].message,
                            time: messages[index].time,
                          );
                        }
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 60,
                                child: Card(
                                  margin: const EdgeInsets.only(
                                      left: 2, right: 2, bottom: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: TextFormField(
                                    controller: _controller,
                                    focusNode: focusNode,
                                    textAlignVertical: TextAlignVertical.center,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 5,
                                    minLines: 1,
                                    onChanged: (value) {
                                      if (value.isNotEmpty) {
                                        setState(() {
                                          sendButton = true;
                                        });
                                      } else {
                                        setState(() {
                                          sendButton = false;
                                        });
                                      }
                                    },
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.all(20),
                                      border: InputBorder.none,
                                      hintText: "Type a message",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      // prefixIcon: IconButton(
                                      //   icon: Icon(
                                      //     show
                                      //         ? Icons.keyboard
                                      //         : Icons.emoji_emotions_outlined,
                                      //   ),
                                      //   onPressed: () {
                                      //     if (!show) {
                                      //       focusNode.unfocus();
                                      //       focusNode.canRequestFocus = false;
                                      //     }
                                      //     setState(() {
                                      //       show = !show;
                                      //     });
                                      //   },
                                      // ),
                                      // suffixIcon: Row(
                                      //   mainAxisSize: MainAxisSize.min,
                                      //   children: [
                                      //     IconButton(
                                      //       icon: const Icon(Icons.attach_file),
                                      //       onPressed: () {
                                      //         // showModalBottomSheet(
                                      //         //     backgroundColor:
                                      //         //         Colors.transparent,
                                      //         //     context: context,
                                      //         //     builder: (builder) =>
                                      //         //         bottomSheet());
                                      //       },
                                      //     ),
                                      //     IconButton(
                                      //       icon: const Icon(Icons.camera_alt),
                                      //       onPressed: () {
                                      //         // Navigator.push(
                                      //         //     context,
                                      //         //     MaterialPageRoute(
                                      //         //         builder: (builder) =>
                                      //         //             CameraApp()));
                                      //       },
                                      //     ),
                                      //   ],
                                      // ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 8,
                                  right: 2,
                                  left: 2,
                                ),
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: const Color(0xFF128C7E),
                                  child: IconButton(
                                    icon: Icon(
                                      sendButton ? Icons.send : Icons.mic,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      if (sendButton) {
                                        _scrollController.animateTo(
                                            _scrollController
                                                .position.maxScrollExtent,
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.easeOut);
                                        sendMessage(
                                            _controller.text,
                                            widget.sourchat.id,
                                            widget.chatModel.id);
                                        _controller.clear();
                                        setState(() {
                                          sendButton = false;
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          show ? emojiSelect() : Container(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              onWillPop: () {
                if (show) {
                  setState(() {
                    show = false;
                  });
                } else {
                  Navigator.pop(context);
                }
                return Future.value(false);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget emojiSelect() {
    return EmojiPicker(
      textEditingController: _controller,
      config: const Config(columns: 7),
    );
  }
}
