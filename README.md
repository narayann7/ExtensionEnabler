<div align="center">
<h1 align="center"  style="font-size: 35px;">🛠️ Extension Enabler 🛠️</h1>
<p align="center">
A command line dev tool that enables flutter web app as chromium based extension with simple commands
</p>
</div>

---

### How to install?

Install it as `dev_dependencies` :
Run this command:

```
flutter pub add -d extension_enabler
```

or add it as dev dependency in your pubspec.yaml:

```
dev_dependencies:
  extension_enabler: ^1.0.5
```

### Stepwise Guide :

#### 1. So First, create ⚡ a project in flutter.

```
 flutter create app_name
```

#### 2. Install ⚙️ the package as dev dependencies.

```
flutter pub add -d extension_enabler
```

#### 3. Run 🏃‍♂️

```
flutter pub run extension_enabler enable
```

and fill the details:

![image](https://user-images.githubusercontent.com/64174995/212165333-10ce1d61-33e1-401b-80dc-5c0e7ef080fa.png)

#### 4. Create a build 🛠️

```
flutter pub run extension_enabler build
```

build will be generated in `build/web`
Above command can also use to rebuild the app.
And to update config run

```
flutter pub run extension_enabler update
```

#### 5. To run in Browser 🌍:

To run the extension on chromium based browser,

go to `browser_name://extensions/` enable Developer Mode in the browser and load the extension

- help :

```
flutter pub run extension_enabler --help
```

![image](https://user-images.githubusercontent.com/64174995/212167844-45ae43f3-036e-4211-bb81-b443b2222908.png)

- If you are facing any issues 🤔 feel free to create issues : [here](https://github.com/narayann7/ExtensionEnabler/issues)
- if want to improve 🛠️ the package, you are welcome 🙏 : [here](https://github.com/narayann7/ExtensionEnabler)

---

#### Created by [Narayan](https://www.linkedin.com/in/narayann/), connect with me [narayann.me](https://narayann.me/)
