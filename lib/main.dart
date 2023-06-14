import 'package:flutter/material.dart';

void main() {
  runApp(ChegaeApp());
}

class ChegaeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chegae',
      theme: ThemeData(primaryColor: Color(0xFF003a81)),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/second': (context) => SecondScreen(),
        '/register': (context) => RegisterScreen(),
        '/login': (context) => LoginScreen(),
        '/profile': (context) => ProfileScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/search': (context) => EventsScreen(),
        '/settings': (context) => SettingsScreen(),
        '/about': (context) => AboutScreen(),
        '/languages': (context) => LanguagesScreen(),
        '/history': (context) => HistoryScreen()
        // Nova rota para a tela de eventos
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/fundo.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: FutureBuilder(
            future: Future.delayed(
                Duration(seconds: 6)), // Tempo de carregamento simulado
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Mostrar tela de carregamento enquanto espera
                return CircularProgressIndicator();
              } else {
                // Navegar para a SecondScreen após o carregamento
                WidgetsBinding.instance!.addPostFrameCallback((_) {
                  Navigator.pushNamed(context, '/second');
                });
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background-recife.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 200,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text('Login'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(150, 50),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text('Cadastro'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(150, 50),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Image.asset(
                      'assets/images/google.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Image.asset(
                      'assets/images/facebook.png',
                      width: 25,
                      height: 25,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF003a81),
      appBar: AppBar(
        backgroundColor: Color(0xFF003A81),
        title: Text('Cadastro'),
        leading: IconButton(
          icon: Image.asset(
            'assets/images/back_button_icon.png',
            width: 24,
            height: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Nome',
                labelStyle: TextStyle(color: Colors.white),
              ),
              style: TextStyle(color: Colors.white),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'E-mail',
                labelStyle: TextStyle(color: Colors.white),
              ),
              style: TextStyle(color: Colors.white),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(color: Colors.white),
              ),
              obscureText: true,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/welcome');
              },
              child: Text('Próximo'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF003a81),
      appBar: AppBar(
        backgroundColor: Color(0xFF003A81),
        title: Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Image.asset(
            'assets/images/back_button_icon.png',
            width: 24,
            height: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'E-mail',
                labelStyle: TextStyle(color: Colors.white),
              ),
              style: TextStyle(color: Colors.white),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(color: Colors.white),
              ),
              obscureText: true,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            Container(
              constraints: BoxConstraints(
                  maxWidth: 200), // Defina a largura máxima desejada aqui
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/welcome');
                },
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF003A81),
      appBar: AppBar(
        backgroundColor: Color(0xFF003A81),
        title: Text(
          'Perfil',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Image.asset(
            'assets/images/back_button_icon.png',
            width: 24,
            height: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background-recife.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 45),
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/andreza.png'),
            ),
            SizedBox(height: 20),
            Text(
              'Andreza Mendes',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/history_icon.png',
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(width: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/history');
                      },
                      child: Text(
                        'Histórico de Visitas',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/settings_icon.png',
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(width: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/settings');
                      },
                      child: Text(
                        'Configurações',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/contact_icon.png',
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(width: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/contact');
                      },
                      child: Text(
                        'Contate-nos',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  width: 120,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0,
                    ),
                    onPressed: () {
                      // Fazer logout
                    },
                    child: Text(
                      'Sair',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF003A81),
          title: Text(
            'Histórico de Visitas',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: Image.asset(
              'assets/images/back_button_icon.png',
              width: 24,
              height: 24,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background-recife.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            padding: EdgeInsets.only(top: 16),
            children: [
              EventItem(
                imageUrl: 'assets/images/viiixe.png',
                eventName: 'VIIIXE! Forró e Piseiro 2023',
                eventDate: '27 de Maio',
              ),
              EventItem(
                imageUrl: 'assets/images/recifetrap.png',
                eventName: 'RECIFE TRAP Festival 2023',
                eventDate: '21 de Abril',
              ),
              EventItem(
                imageUrl: 'assets/images/recifeverde.png',
                eventName: 'Festival RECIFE + VERDE 2023',
                eventDate: '01 de Abril',
              ),
              // Adicione mais EventItems conforme necessário
            ],
          ),
        ));
  }
}

class EventItem extends StatelessWidget {
  final String imageUrl;
  final String eventName;
  final String eventDate;

  const EventItem({
    required this.imageUrl,
    required this.eventName,
    required this.eventDate,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 24,
        backgroundImage: AssetImage(imageUrl),
      ),
      title: Text(
        eventName,
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      subtitle: Text(
        eventDate,
        style: TextStyle(color: Colors.white),
      ),
      onTap: () {
        // Lógica para exibir detalhes do evento
      },
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background-recife.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: 300, // Ajuste o tamanho da imagem aqui
              ),
            ),
            SizedBox(height: 60), // Ajuste o espaçamento aqui
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(height: 10), // Ajuste o espaçamento aqui
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, '/profile');
                      },
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        width: 24, // Ajuste o tamanho da imagem aqui
                        height: 24, // Ajuste o tamanho da imagem aqui
                        child: Image.asset(
                          'assets/images/profile_icon.png',
                          color: Colors.white, // Ajuste a cor da imagem aqui
                        ),
                      ),
                      title: Text(
                        'Perfil',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10), // Ajuste o espaçamento aqui
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, '/search');
                      },
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        width: 24, // Ajuste o tamanho da imagem aqui
                        height: 24, // Ajuste o tamanho da imagem aqui
                        child: Image.asset(
                          'assets/images/events_icon.png',
                          color: Colors.white, // Ajuste a cor da imagem aqui
                        ),
                      ),
                      title: Text(
                        'Eventos',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10), // Ajuste o espaçamento aqui
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, '/settings');
                      },
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        width: 24, // Ajuste o tamanho da imagem aqui
                        height: 24, // Ajuste o tamanho da imagem aqui
                        child: Image.asset(
                          'assets/images/settings_icon.png',
                          color: Colors.white, // Ajuste a cor da imagem aqui
                        ),
                      ),
                      title: Text(
                        'Configurações',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  child: Text(
                    'Sair',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF003A81),
      appBar: AppBar(
        backgroundColor: Color(0xFF003A81),
        title: Text(
          'Configurações',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Image.asset(
            'assets/images/back_button_icon.png',
            width: 24,
            height: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 16),
        children: [
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
            leading: Container(
              width: 24, // Ajuste o tamanho da imagem aqui
              height: 24, // Ajuste o tamanho da imagem aqui
              child: Image.asset(
                'assets/images/sobre_icon.png',
                color: Colors.white, // Ajuste a cor da imagem aqui
              ),
            ),
            title: Text(
              'Sobre o Chegae',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/languages');
            },
            leading: Container(
              width: 24, // Ajuste o tamanho da imagem aqui
              height: 24, // Ajuste o tamanho da imagem aqui
              child: Image.asset(
                'assets/images/idioma_icon.png',
                color: Colors.white, // Ajuste a cor da imagem aqui
              ),
            ),
            title: Text(
              'Idiomas',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/security');
            },
            leading: Container(
              width: 24, // Ajuste o tamanho da imagem aqui
              height: 24, // Ajuste o tamanho da imagem aqui
              child: Image.asset(
                'assets/images/seguranca_icon.png',
                color: Colors.white, // Ajuste a cor da imagem aqui
              ),
            ),
            title: Text(
              'Segurança',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/accessibility');
            },
            leading: Container(
              width: 24, // Ajuste o tamanho da imagem aqui
              height: 24, // Ajuste o tamanho da imagem aqui
              child: Image.asset(
                'assets/images/acessibilidade_icon.png',
                color: Colors.white, // Ajuste a cor da imagem aqui
              ),
            ),
            title: Text(
              'Acessibilidade',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/device');
            },
            leading: Container(
              width: 24, // Ajuste o tamanho da imagem aqui
              height: 24, // Ajuste o tamanho da imagem aqui
              child: Image.asset(
                'assets/images/dispositivo_icon.png',
                color: Colors.white, // Ajuste a cor da imagem aqui
              ),
            ),
            title: Text(
              'Dispositivo',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/help');
            },
            leading: Container(
              width: 24, // Ajuste o tamanho da imagem aqui
              height: 24, // Ajuste o tamanho da imagem aqui
              child: Image.asset(
                'assets/images/ajuda_icon.png',
                color: Colors.white, // Ajuste a cor da imagem aqui
              ),
            ),
            title: Text(
              'Ajuda',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF003A81),
      appBar: AppBar(
        backgroundColor: Color(0xFF003A81),
        title: Text(
          'Sobre o Chegaê',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Image.asset(
            'assets/images/back_button_icon.png',
            width: 24,
            height: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Versão do Aplicativo',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              '1.0.0',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 16),
            Text(
              'Descrição',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              'O Chegaê é um aplicativo para conectar pessoas e facilitar a organização de eventos e encontros.',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 16),
            Text(
              'Desenvolvedores',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              'Andreza Mendes\n\nAysha Maria\n\nGabriel Albuquerque\n\nLetícia Arruda\n\nMercia Moura\n\nRuan Fellyp\n\nThalita Miquiles',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class LanguagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF003A81),
      appBar: AppBar(
        backgroundColor: Color(0xFF003A81),
        title: Text(
          'Idiomas',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Image.asset(
            'assets/images/back_button_icon.png',
            width: 24,
            height: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 16),
        children: [
          ListTile(
            leading: Container(
              width: 24, // Ajuste o tamanho da imagem aqui
              height: 24, // Ajuste o tamanho da imagem aqui
              child: Image.asset(
                'assets/images/brasil.png',
              ),
            ),
            title: Text(
              'Português',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              // Lógica para definir o idioma como Português
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Container(
              width: 24, // Ajuste o tamanho da imagem aqui
              height: 24, // Ajuste o tamanho da imagem aqui
              child: Image.asset(
                'assets/images/estados-unidos.png',
              ),
            ),
            title: Text(
              'English',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              // Lógica para definir o idioma como Inglês
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Container(
              width: 24, // Ajuste o tamanho da imagem aqui
              height: 24, // Ajuste o tamanho da imagem aqui
              child: Image.asset(
                'assets/images/espanha.png',
              ),
            ),
            title: Text(
              'Español',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              // Lógica para definir o idioma como Espanhol
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Container(
              width: 24, // Ajuste o tamanho da imagem aqui
              height: 24, // Ajuste o tamanho da imagem aqui
              child: Image.asset(
                'assets/images/franca.png',
              ),
            ),
            title: Text(
              'Français',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              // Lógica para definir o idioma como Francês
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class Event {
  final String eventName;
  final String imagePath;
  final String price;
  final String openingHours;
  final String address;
  final String phoneNumber;

  Event({
    required this.eventName,
    required this.imagePath,
    required this.price,
    required this.openingHours,
    required this.address,
    required this.phoneNumber,
  });
}

class EventDetailsScreen extends StatelessWidget {
  final Event event;

  const EventDetailsScreen({required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF003A81),
        title: Text(
          event.eventName,
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Image.asset(
            'assets/images/back_button_icon.png',
            width: 24,
            height: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              event.imagePath,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height *
                  0.4, // Set the desired height
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.eventName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/money_icon.png',
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(width: 10),
                      Text(
                        event.price,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/time_icon.png',
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(width: 10),
                      Text(
                        event.openingHours,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/location_icon.png',
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(width: 10),
                      Text(
                        event.address,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/phone_icon.png',
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(width: 10),
                      Text(
                        event.phoneNumber,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String eventName;
  final String eventDate;
  final String imagePath;

  const EventCard({
    required this.eventName,
    required this.eventDate,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    // Implement the UI for the event card
    return Container(
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width *
          0.8, // Define the width of the event card
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  eventName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  eventDate,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EventsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implement the UI for the events screen
    return Scaffold(
      backgroundColor: Color(0xFF003A81),
      appBar: AppBar(
        backgroundColor: Color(0xFF003A81),
        title: Text(
          'Eventos',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Image.asset(
            'assets/images/back_button_icon.png',
            width: 24,
            height: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EventDetailsScreen(
                    event: Event(
                      eventName: 'UNITE IN RESONANCE',
                      imagePath: 'assets/images/event1.png',
                      price: 'R\$100,00',
                      openingHours: '01 de Julho | 20:00 - 08:00',
                      address: 'Avenida Alfredo Lisboa, Recife-PE',
                      phoneNumber: 'Indisponível',
                    ),
                  ),
                ),
              );
            },
            child: EventCard(
              eventName: 'UNITE IN RESONANCE',
              eventDate: '01 de Jul',
              imagePath: 'assets/images/event1.png',
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EventDetailsScreen(
                    event: Event(
                      eventName: 'Nova História Festival',
                      imagePath: 'assets/images/event2.png',
                      price: 'Em breve...',
                      openingHours: 'Em breve...',
                      address: 'Recife-PE',
                      phoneNumber: 'Indisponível',
                    ),
                  ),
                ),
              );
            },
            child: EventCard(
              eventName: 'Nova História Festival',
              eventDate: '05 de Ago',
              imagePath: 'assets/images/event2.png',
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EventDetailsScreen(
                    event: Event(
                      eventName: 'Vaquejada de Surubim',
                      imagePath: 'assets/images/event3.png',
                      price: 'Em breve...',
                      openingHours: 'Em breve...',
                      address: 'Surubim - PE',
                      phoneNumber: 'Indisponível',
                    ),
                  ),
                ),
              );
            },
            child: EventCard(
              eventName: 'Vaquejada de Surubim',
              eventDate: '16 de Set',
              imagePath: 'assets/images/event3.png',
            ),
          ),
        ],
      ),
    );
  }
}
