using dom
using domkit
using haystack
using skyarcd
using ui
using concurrent
using axon

@Js
public class ViewTwo : UiView {

  private UiViewBar? viewBar
  private Elem[] buttons

  new make()
  {
    this.viewBar = UiViewBar(this)
    this.buttons = viewBar.children
  }

  public override Void onUpdate() {

    Str selectPane := this.var("subViewSelector").toStr
    echo(selectPane)

    topBarBox := FlowBox {
      it.halign = Align.left
      it.gaps = ["10px", "10px"]
      buttons[1],
      buttons[0],
    }

    buttons.each() |btn|
    {
       echo(btn.typeof)
    }

    ///////
    //Subview One
    ///////
    if (selectPane == "One")
    {
      this.removeAll
      main := SashBox {
        it.dir = Dir.down
        it.sizes = [ "34px", "38px", "100%" ]
        topBarBox,
        FlowBox {
          it.halign = Align.left
          buttons[3],
        },
        GridTable {
          it.model = GridTableModel.make(this.session, this.data, ["target","errType","msg"])
          it.rebuild
        },
      }
      this.add(main)

    ///////
    //Subview Two
    ///////
    }
    else if (selectPane == "Two")
    {
      this.removeAll
      main := SashBox {
        it.dir = Dir.down
        it.sizes = [ "34px", "38px", "100%" ]
        topBarBox,
        FlowBox {
          it.halign = Align.left
          buttons[4],
        },
        GridTable {
          it.model = GridTableModel.make(this.session, this.data, ["id","errType","msg"])
          it.rebuild
        },
      }
      this.add(main)

    ///////
    //Subview Three
    ///////
    }
    else if (selectPane == "Three")
    {
      this.removeAll
      main := SashBox {
        it.dir = Dir.down
        it.sizes = [ "34px", "38px", "100%" ]
        topBarBox,
        FlowBox {
          it.halign = Align.left
          buttons[5],
        },
        GridTable {
          it.model = GridTableModel.make(this.session, this.data, ["id","errType","msg"])
          it.rebuild
        },
      }
      this.add(main)
    }
    ///////
    //Subview Four
    ///////
    else if (selectPane == "Four")
    {

      this.removeAll
      main := SashBox {
        it.dir = Dir.down
        it.sizes = [ "34px","100%" ]
        topBarBox,
        //UiViewBar(this),
        subViews[0],
      }
      this.add(main)

    }

  }
}