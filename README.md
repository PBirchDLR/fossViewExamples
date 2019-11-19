Free Open Source Software – Fantom View Example Extension
###

**Summary**

This extension is designed as a learning tool designed to teach developers how to design applications and views for SkySpark.  There are three default views that come with this package, as explained in the sections below.  All source code is open and free to download by anyone.  If you have any questions, comments, or bugs feel free to message pbirch@dlrgroup.com.  
If you are new to building POD’s in SkySpark, please see the next section of this document.  If you are a more advanced user looking to see how to create custom UI’s using fantom and domkit, please see the section labeled 'View 3 – Advanced Fantom and Domkit UI'.

**Working with PODs**

This documentation is not designed to replace the existing SkySpark documentation, its designed to be a supplement to help you get started with building pods.  Some helpful documentation links from SkyFoundry are below.
The extStub documentation shows you a simple to use command line prompt that generates a fresh POD from scratch.

`https://skyfoundry.com/doc/docSkySpark/Exts#extStub`

The docFresco section provides a lot of useful resources around POD based applications.  Specifically, the views, actions, and templates sections are useful.

`https://skyfoundry.com/doc/docFresco/Overview`

DomKit is the UI class that is used to create custom looking user interfaces.  It provides custom organization elements and a large selection of controls (like buttons, drop down boxes, ect).

`https://skyfoundry.com/doc/domkit/index`

**View 1**

This view is designed as an entry level introduction into simply converting over views designed fully in SkySpark and adding them to an extension in SkySpark.  The view is defined inside the file 'lib/views/views.trio' and is called 'testPodFanView_one'.  All of the code contained in the src tag is copied from the SkySpark view record.  The meta tags view, appName, and disKey, and src are required. 
To define a custom application for this view to be contained inside of, add it in the file 'lib/views/appView.trio'.

**View 2**

This view takes the concepts from view 1 and adds on custom action buttons to them.  Action buttons documentation are in the docFresco|Actions documentation in SkySpark.  The action buttons are defined via fantom code in 'fan/FossViewExamplesLib.fan'.
  
  ```
  @Axon { meta =
  Str<|disKey: "fossViewExamplesExt::testMulti"
       admin
       select
       multi
       |> }
  static Void testMulti(Grid testEditMultiSiteDict)
  {
    testEditMultiSiteDict.each() |item|
    {
      echo(item)
    }
    echo("Do Something here")
  }
```

The action has two main sections, header information and the code you want to execute.
This view also uses a custom Axon script to load data, contained inside 'lib/funcs/two/viewTwoMain.trio'.

**View 3**

To take the development of our sample application one step further, we drop down fully into Fantom and develop a custom UI using domkit.  The first step is defining our view as a custom UI type.  This points to a fantom file, located inside of 'fan/ui/TestPodFanViewThree.fan'.

```
view: testPodFanview_three
appName: fossViewExamples
order: 3
disKey: "View Three"
src:
  view: { uiType:"fossViewExamplesExt::ViewThree" }
  search: {var kind:"Str" defVal:""}
  data: { expr: "viewThreeMain({{search}})" }
```

The Axon function inside the data tag of our view definition is ran on every screen update.  Inside the fantom function, all domkit UI elemnts are located inside onUpdate.

```
  @Js
  public class MyTestView: UiView 
  {
    public override Void onUpdate() 
    {
      //Things put in here are executed on every page update.
      // This is where you put your custom domKit code.
    }
  }
```
