# 🏗️ Projeto Flutter

## 📋 Requisitos
Certifique-se de ter os seguintes itens instalados:

- [Flutter](https://docs.flutter.dev/get-started/install) (versão recomendada: 3.27.4)
- [Dart](https://dart.dev/get-dart)
- [Android Studio](https://developer.android.com/studio) ou [VS Code](https://code.visualstudio.com/) com a extensão Flutter
- Dispositivo físico ou emulador configurado

## 🚀 Configuração do Ambiente

1. Clone o repositório:
   ```sh
   git clone https://github.com/danielnoliveira/taski_app.git
   cd taski_app
   ```

2. Instale as dependências:
   ```sh
   flutter pub get
   ```

3. Verifique se o ambiente está pronto:
   ```sh
   flutter doctor
   ```
   Se houver erros, siga as recomendações exibidas para corrigir.

## ▶️ Executando o Projeto

### 📱 Em um Emulador ou Dispositivo Físico

1. Inicie um emulador ou conecte um dispositivo.
2. Execute:
   ```sh
   flutter run --no-enable-impeller
   ```


## 📄 Estrutura do Projeto

```
lib
├── app
│   ├── core
│   │   ├── enums
│   │   ├── extensions
│   │   ├── features
│   │   │   └── tasks
│   │   │       ├── models
│   │   │       └── repository
│   │   ├── helpers
│   │   ├── mixins
│   │   ├── models
│   │   ├── routes
│   │   ├── services
│   │   │   └── local
│   │   └── utils
│   ├── default_ui
│   ├── modules
│   │   ├── auth
│   │   │   └── pages
│   │   │       └── splash
│   │   └── home
│   │       ├── subpages
│   │       │   ├── done_page
│   │       │   │   └── widgets
│   │       │   ├── search_page
│   │       │   │   └── widgets
│   │       │   └── todo_page
│   │       │       └── widgets
│   │       └── widgets
│   └── theme
├── resources
```

