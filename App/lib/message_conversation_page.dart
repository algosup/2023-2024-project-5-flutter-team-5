import 'package:flutter/material.dart';
import 'useful.dart';

class MessageConversationPage extends StatefulWidget {
  final String name;

  const MessageConversationPage({Key? key, required this.name})
      : super(key: key);

  @override
  State<MessageConversationPage> createState() =>
      _MessageConversationPageState();
}

class _MessageConversationPageState extends State<MessageConversationPage> {
  final Themes themes = Themes();
  MessageHandler messageHandler = MessageHandler();
  TextEditingController _textEditingController = TextEditingController();

  void _addMessage() {
    setState(() {
      String trimmedText = _textEditingController.text.trimRight();
      if (trimmedText.isNotEmpty) {

        messageHandler.addSentMessage(trimmedText);
      }
      _textEditingController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themes.currentTheme.colorScheme.secondary,
      appBar: AppBar(
          backgroundColor: themes.currentTheme.colorScheme.primary,
          foregroundColor: themes.currentTheme.colorScheme.onPrimary,
          titleTextStyle: TextStyle(
            color: themes.currentTheme.colorScheme.onPrimary,
            fontWeight: FontWeight.w700,
            fontFamily: 'Inter',
            fontSize: 20,
          ),
          title: Text(widget.name)),
      body: SingleChildScrollView(
        reverse: true,
        child: messageHandler.getSentMessage(widget.name),
      ),
      bottomNavigationBar: BottomAppBar(
        color: themes.currentTheme.colorScheme.primary,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _textEditingController,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                style: TextStyle(
                  color: themes.currentTheme.colorScheme.onPrimary,
                ),
                decoration: InputDecoration(
                  hintText: 'message',
                  hintStyle: TextStyle(
                    color: themes.currentTheme.colorScheme.onPrimary
                        .withOpacity(0.7),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none, // No border
                  ),
                  filled: true,
                  fillColor: themes
                      .currentTheme.colorScheme.secondary, // Background color
                ),
              ),
            ),
            IconButton(
                color: themes.currentTheme.colorScheme.onPrimary,
                icon: const Icon(Icons.send),
                onPressed: _addMessage),
          ],
        ),
      ),
    );
  }
}

class SendMessage extends StatefulWidget {
  final String message;

  const SendMessage({Key? key, required this.message}) : super(key: key);

  @override
  State<SendMessage> createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  final Themes themes = Themes();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.fromLTRB(100, 5, 10, 5),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: themes.currentTheme.colorScheme.primaryContainer,
        ),
        child: Text(
          widget.message,
          style: TextStyle(
            fontSize: 17,
            color: themes.currentTheme.colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}

class GetMessage extends StatefulWidget {
  final String message;

  const GetMessage({Key? key, required this.message}) : super(key: key);

  @override
  State<GetMessage> createState() => _GetMessageState();
}

class _GetMessageState extends State<GetMessage> {
  final Themes themes = Themes();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.fromLTRB(10, 5, 100, 5),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: themes.currentTheme.colorScheme.primary,
        ),
        child: Text(
          widget.message,
          style: TextStyle(
            fontSize: 17,
            color: themes.currentTheme.colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}

class MessageHandler {
  List<String> _sentMessages = [];

  Column getSentMessage(String name) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GetMessage(
          message:
              "Bonjour,\n\nNous espérons que vous allez bien. Nous avons été particulièrement impressionnés par vos compétences en communication, votre capacité à travailler en équipe et votre attitude proactive. Ces qualités correspondent parfaitement à ce que nous recherchons chez $name .\n\nNous serions ravis de discuter avec vous des opportunités potentielles au sein de notre équipe. Pourrions-nous organiser un entretien à votre convenance ?\n\nDans l'attente de votre réponse, nous vous souhaitons une excellente journée.",
        ),
        ..._sentMessages.map((str) => SendMessage(
              message: str,
            )),
      ],
    );
  }

  addSentMessage(String message) {
    _sentMessages.add(message);
  }
}
