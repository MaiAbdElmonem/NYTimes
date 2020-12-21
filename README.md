# NYTimes

# Install
* Run in terminal
```
pod install
```


# App Structure

* App structure I use **MVVM** with RxSwift.

* I use the **The Clean Architecture ** .

![](https://blog.cleancoder.com/uncle-bob/images/2012-08-13-the-clean-architecture/CleanArchitecture.jpg)

* I use **CellReusable** protocol and create 2 extensions for UITableView to reduce code when reusing the cell.

* Create Extension for UIImageView to download the image from the link.

* I used [SwiftLint](https://github.com/realm/SwiftLint) to enhance Swift style.

* I used [JSONExport](https://github.com/Ahmed-Ali/JSONExport) to generate model from JSON.

* I used create UI with code.

* I use  this answer to [check internet connection](https://stackoverflow.com/questions/39558868/check-internet-connection-ios-10/52998897#52998897)

* I used Cocopods.



# UnitTest
* I apply  **Arrange, Act and Assert (AAA) Pattern** in Unit Testing.

# know Issues
* Not show Details for news when user tapped on cell
* Not handle no internet connection
* Not show loading at the begging of view controller till getting the data from API 
* Make the Domain and Data layers as Targets will make the code cleaner and resuable 
