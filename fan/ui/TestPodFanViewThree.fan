using dom
using domkit
using haystack
using skyarcd
using ui
using concurrent
using axon
using graphics

@Js
public class ViewThree : UiView {

  public override Void onUpdate() {  //This method is called every time a refresh is triggered

    Str siteName := ""
    Str search := this.var("search").toStr
    this.removeAll  //Remove all elemnts from the screen before rebuilding them.

    //The axon function 'demoViewThree' is called on every refresh.  The data it outputs can be accessed via using 'this.data', it is a grid type.
    
    newSitePopup := Dialog
    {
    }
    newSitePopup.add(SashBox
    {
      it.dir = Dir.down
      it.sizes = ["38px", "100%"]
      it.style->width = "500px"
      it.style->height = "180px"
      FlowBox {
        it.halign = Align.center
        it.style.setCss("background-color: #325D84")
        Label {
          it.text = "New Site"
          it.style.setCss("font-weight:500;color: #ffffff; padding-top: 12px")
        },
      },
      FlowBox {
        it.style.setCss("padding-left:50px; padding-top:25px; padding-right:50px")
        SashBox {
          it.dir = Dir.down
          it.sizes = ["30px", "38px"]
          TextField {
            it.placeholder = "Site Name..."
            it.onModify |f| {
              siteName = f.val
            }
          },
          FlowBox {
            it.halign = Align.left
            it.style.setCss("padding-top:5px")
            it.gaps = ["5px"]
            it.style.setCss("padding-right: 10px")
            Button { 
              it.text="Create"
              it.style.setCss("background-color: #00ADEF; color: #ffffff")
              it.onAction { 
                  if (siteName != "")
                  {
                    newSitePopup.close
                    this.session.api.eval("viewThree_createSite(\"" + siteName + "\")").onOk|Grid g| {   //This runs an axon function asynch, always make sure the axon function that runs here is very light.
                      this.update()  //Refresh the page
                    }
                  }
                }
              },
            Button { 
              it.text="Cancel"
              it.onAction { 
                newSitePopup.close
              }
            },
          },
        },
      },        
    })

    //Build our user interface
    main := SashBox {
      it.dir = Dir.down
      it.sizes = ["60px", "100%"]
      it.style.setCss("border-bottom: 1px solid #D1D3D4")  //You can define custom CSS styling by using this method here.  Css styling can be applied on every Domkit Element.
      FlowBox {
        it.style.setCss("background-color:#325D84")
        it.gaps = ["5px"]
        Elem("img") {  //You can define custom elemnts using this function.  Any default html elemnt type can be used here.  In this case we insert an icon.
          it.style.setCss("padding-left:5px; padding-top:5px")
          it["src"] = UiUtil.iconUri("site", "color", null).toStr
          it["alt"] = "site"
          it["height"] = "50px"
          it["width"] = "50px"
        },
        Label {
          it.text = "Pretty, But Useless Site Editor"
          it.style.setCss("color:#ffffff; font-weight:bold; font-family:Roboto; font-size: 30px; padding-top:15px")
        },
      },
      SashBox {
        it.dir = Dir.down
        it.style.setCss("background-color:#D1D3D4")
        it.sizes = ["20px", "10px", "100%"]
        it.style.setCss("padding:10px")
        FlowBox {
          it.gaps = ["5px"]
          Button {
            it.text = "New Site"
            it.onAction {newSitePopup.open}
          },
          TextField { 
            it.placeholder = "Search..." 
            if (search != "") it.val = search
            it.onAction |f| { update(["search": f.val]) }
          }
        },
        Elem(),
        GridTable {
          it.model = GridTableModel.make(this.session, this.data, ["id", "area", "tz"])
          it.rebuild
        },
      },
      
    }

    this.add(main)
    

  }
}