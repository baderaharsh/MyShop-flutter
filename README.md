# MyShop

Building this application using Flutter & Dart to learn about State Management in Flutter & Dart.

################################################################################

######################## Learning State Management in Flutter ##################

################################################################################

# Steps followed while creating this application

Step 1 - Initialised Products overview page which is home page and created model for Products.

Step 2 - In products_overview_screen added sample data for products in List<Product> & this widget will return Scaffold containing GridView.builder(). 

Step 3 - To display each GridView item(product), new widget product_item is created which takes product id, product title and product image URL as input and returns GridTitle(product).

Step 4 - Made some changes for Theming and styling, added new fonts Anton and Lato.

Step 5 - Created product_details_Screen widget which will be used to display the details of selected product.

Step 6 - For managing the state of app, implemented Provider and Listener for retrieving product data and changing the states without the need of re-building the entire Widget tree, but instead re-building the widgets using the data which was modified or changed. For this, added dependency- "provider". Created provider file for products and added product data in it. Implemented and used various classes like ChangeNotifier, ChangeNotifierProvider(), Provider.of<name_of_provider_class>(context).name_of_variable_to_access.

Step 7 - For managing favorite products, implemented another provider for handling each product item in the grid. Converted Product model into a Provider and shifted in providers folder. So now, on the each tap on the favorite icon of an item in grid view, the build for the same product only will run changing the icon/status of favorite item.

Step 8 - Implemented alternative syntex for building each item on screen and favorite button. For each item in Grid, used ChangeNotifierProvider.value() which is preferred way to implement it as we are not initializing any object but only using the instanciated values. Later, used Consumer<Product> in product_item to avoid rebuilding of whole item on each tap. Using Consumer will change the state of button only.

Step 9 - Implemented logic to display favorite items only.

Step 10 - Created Cart provider, where Cart body and Cart Provider logic is implemented.

Step 11 - In main.dart file, to use multiple providers, used MultiProvider class.

Step 12 - Ready badge file downloaded, and connected Cart button icon on product and Cart Icon on App Bar.

Step 13 - Implemented cart page where the details about all the products in cart wil be displayed. Used NetworkImage to display image in ListTile's Circle Avatar.

Step 14 - Used Dismissible() widget to remove a product from the cart (implemented "removeItem" in Cart provider) on left swipe. 

Step 15 - Implemented logic to handle "Order now" button, which will clear the cart and store the order details.

Step 16 - Implemented Drawer to switch between Shop page and Order history page. 
 
Step 17 - By implementing Orders page, completed the chapter of State Management in flutter using Providers.


################################################################################

######################## Working with User Inputs and Forms ##################

################################################################################

Step 1 - Added a snackbar with undo button, which will be invoked after adding an item in the cart. This is implemented in cart_item.dart file. Logic to remove added item, logic is implemented in Cart provider.

Step 2 - Added alert dialogue box to confirm the removal of an item from the Cart. For this, used confirmDismiss arguement in Dismissible where returning Future <bool> to confirm removal. 

Step 3 - Added new page/screen to edit or add new product. On this page, used 'form' widget and added text input fields using TextFormField.

Step 4 - To go to the next field using soft keyboard, the TextInputAction is set to 'next' and used FocusNode() do implement this.

Step 5 - Added input field for Image URL. After entering the Image URL, preview of image will be available.

Step 6 - Storing input data of form using GlobalKey and FormState in a variable.

Step 7 - Implemented and applied validators for all input fields using 'validator' arguement in TextFormField widget. Now user can add new product in _items: list of products.

Step 8 - Implemented the 'Edit Product' feature using which now user can edit the existing product from 'Manage Products' screen.

Step 9 - User now can delete any product from the 'Manage Products' screen

################################################################################

################################ Sending http request ##########################

################################################################################

Step 1 - Added new dependency : 'http' package to work http requests and store product data on cloud servers.

Step 2 - Created new project and realtime database in test on Firebase. Used generated link in Products provider to send post request and store product data of newly added product on cloud server. For sending data by post request, the data should be in JSON format, but we have product as a object. Imported 'dart:convert' to use json.encode() method to convert object into a json. Used MAPs to format product data.

Step 3 - Added circular loading indicator which will be displayed until the data is uploaded on server successfully.

Step 4 - Alert box will appear if any error is occured.

Step 5 - Modified code by using 'async' & 'await' keywords.

Step 6 - Using get() method fetching products data from the cloud.

Step 7 - Used RefreshIndicator() widget to implement refresh page feature which can be used by swipining down.

Step 8 - Using patch() http request updating the details of the product on cloud.

Step 9 - Used Delete() http request for deleting a product from cloud.

Step 10 - Implemented Get() and Post() requests for maintaining orders also.

Step 11 - Implemented Orders fetching operation using FutureBuilder.

################################################################################

############################# Adding User Authentication #######################

################################################################################

Step 1 - Added Authentication screen and set it as a Home Screen.

Step 2 - Implemented logic for Sign Up and Log In using Firebase. Used REST API for authentication by sending Post request for both Sign Up and Log In.

Step 3 - Implemented error handling. As we receive error message as REST API instead of Status code from Firebase, Parsed response to check error and handle it manually by throwing exception manually. Implemented dialog box to display respective error message based on type of error to the user.

Step 4 - Favorites will be handled separately.

Step 5 - Successfully completed this section by managing all app data on Firebase and storing current authenticated session on local device storage using "Shared preferences" dependency.
