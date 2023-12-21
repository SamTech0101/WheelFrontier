# ABS Panels App

This app is designed for both the dealership and ABS admin to manage and interact with their customer and audiences.

## Overview

The app is divided into four layers:
(In each section the folders are organized based on features)

### application :
 Where the data get orchestrated between the api and ui.it is essentially the brain of the app and decides what to fetch from the api and how to send it to ui.equivalent of controller in MVC and ViewModel in MVVM.we use bloc pattern for this.bloc package is used for handling the global state of the app and flutter_bloc package is used for passing the state down the widget tree and sending events from the ui to bloc.
 each feature of the app has its own folder in the application folder wich contains the bloc for that feature and can have more files that is need for that feature like util functions and things like that.

### presentation :
 Ui of the app.the pages of the app are organized into a folder with the name of page and may have a subfolder called widgets for custom widgets that are used inside that page or feature.both the stateless and statefull widget are used in the app but statefull widgets state are only for ephemeral state or temporary state.ephemeral state like an ExpansionTile state for knowing if it should be closed or open.temporary state is used in filters page for saving users filters before the user presses on save button.

 
### domain :
 Where the business logic of the app resides.since the app has a backend and most of the business logic is handled there, the domain is for storing entities and repository interfaces for getting entity models from api.Domain does not have a dependency on any other layer but all other layers are dependent of domain.


### data :
 Repository interfaces that were created for each model in domain gets implemented in data layer.The data layer is responsible for all things related to saving and retrieving data : getting entities from api,reading user prefrences from local storage,sending authentication tokens to api,storing JWTs to secure storatge and ... 

### core :
the things that does not belong to any one layer and is used from two or more layers.like dependency injection and extention methods on packages.


## Additional notes :
- for passing data down the widget tree when flutter_bloc and getIt where adding complexity, simple InheritedWidget from flutter sdk is used
- since tha app has two different ui and features for admin and dealership panel, each layer is divided into admin_panle and dealership_panel and for features that are shared a core folder is created.




