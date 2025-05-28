import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

void main() async {
  String username = 'saul.ramos07@aluno.ifce.edu.br';
  String password = 'zzcvnldyydollzhc';
  final smtpServer = gmail(username, password);

  final message = Message()
    ..from = Address(username, 'Seu Nome')
    ..recipients.add('saulrmsmag@gmail.com')
    ..subject = 'Teste de envio via Dart :: ${DateTime.now()}'
    ..text = 'Oláola to enviando um email pra mim mesmo soq por meio de outra conta.';

  try {
    final sendReport = await send(message, smtpServer);
    print('E-mail enviado com SUCESSO: ${sendReport.toString()}');
  } on MailerException catch (e) {
    print('ERRO ao enviar o e-mail.');
    for (var p in e.problems) {
      print('🔸 ${p.code}: ${p.msg}');
    }
  }
}