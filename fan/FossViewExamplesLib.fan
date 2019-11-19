using haystack
using util
using axon
using skyarcd
using folio
using sparkExt
using obixExt

public const class FossViewExamplesLib
{

  ******************
  **Action Buttons**
  ******************

  ** Overview:
  **  Things in here
  **
  ** Returns:
  **  None
  @Axon { meta =
  Str<|disKey: "fossViewExamplesExt::testNewSite"
       admin
       |> }
  static Void testNewSite(Grid testNewSiteDict)
  {
    tag := testNewSiteDict.first
    Bool validateTags := true

    //Verify that all boxes are filled in, if not set 'validateTags' to false
    if (tag["navName"] == "")
    { validateTags = false }
    else if (tag["age"] == Date("2000-01-01"))
    { validateTags = false }
    else if (tag["area"].toStr() == "0")
    { validateTags = false }
    else if (tag["tz"] == "")
    { validateTags = false }
    else if (tag["weatherRef"] == Ref.nullRef)
    { validateTags = false }

    //If 'validateTags' are set to false, throw a warning to the user to fill in all required information.
    if (validateTags == false)
    {
      throw Err("All fields must be filled in for this site to be created!")
    }

    //Create the diffs to be commited
    Dict diffs := Etc.makeDict([
      "site" : Marker.val,
      "navName" : tag["navName"],
      "dis" : tag["navName"],
      "age" : tag["age"],
      "area" : tag["area"],
      "tz" : tag["tz"],
      "weatherRef" : tag["weatherRef"]
    ])

    //Set a tag by itself
   // if (tag.has("fooBar"))
    //{
   //   diffs = Etc.dictSet(diffs, "fooBar", tag["fooBar"])
    //}

    //Commit the site to the database.
    Context.cur.proj.commit(Diff.makeAdd(diffs))
  }

  ** Overview:
  **  Things in here
  **
  ** Parameters:
  ** - 'testEditSiteDict': Grid with a single dict, containing
  **    the tags to be altered.
  **
  ** Returns:
  **  None
  @Axon { meta =
  Str<|disKey: "fossViewExamplesExt::testEditSite"
       admin
       select
       |> }
  static Void testEditSite(Grid testEditSiteDict)
  {
    tag := testEditSiteDict.first
    siteId := tag["id"]
    Dict? siteRec := Context.cur.proj.read("id==@${siteId}")

    Dict diffs := Etc.emptyDict()

    //Verify that all boxes are filled in, if not set 'validateTags' to false
    if (tag.has("navName"))
    { diffs = Etc.dictSet(diffs, "navName", tag["navName"]) }
    else if (tag.has("age"))
    { diffs = Etc.dictSet(diffs, "age", tag["age"]) }
    else if (tag.has("area"))
    { diffs = Etc.dictSet(diffs, "area", tag["area"]) }
    else if (tag.has("tz"))
    { diffs = Etc.dictSet(diffs, "tz", tag["tz"]) }
    else if (tag.has("weatherRef"))
    { diffs = Etc.dictSet(diffs, "weatherRef", tag["weatherRef"]) }
    else if (tag.has("geoCountry"))
    { diffs = Etc.dictSet(diffs, "geoCountry", tag["geoCountry"]) }
    else if (tag.has("geoCity"))
    { diffs = Etc.dictSet(diffs, "geoCity", tag["geoCity"]) }
    else if (tag.has("geoCounty"))
    { diffs = Etc.dictSet(diffs, "geoCounty", tag["geoCounty"]) }
    else if (tag.has("geoPostalCode"))
    { diffs = Etc.dictSet(diffs, "geoPostalCode", tag["geoPostalCode"]) }
    else if (tag.has("geoState"))
    { diffs = Etc.dictSet(diffs, "geoState", tag["geoState"]) }
    else if (tag.has("geoStreet"))
    { diffs = Etc.dictSet(diffs, "geoStreet", tag["geoStreet"]) }
    else if (tag.has("geoAddr"))
    { diffs = Etc.dictSet(diffs, "geoAddr", tag["geoAddr"]) }
    else if (tag.has("connRef"))
    { diffs = Etc.dictSet(diffs, "connRef", tag["connRef"]) }

    //Commit the site to the database.
    Context.cur.proj.commit(Diff.make(siteRec, diffs))
  }

  ** Overview:
  **  Confirm type pop-up box
  **
  ** Parameters:
  ** -'targetRef': The id of the record to be deleted.
  **
  ** Returns:
  **  None
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
    echo("Do Something all of the things here")
    /*
    Dict? mappingRec := Context.cur.proj.read("id==@${targetRef}")
    Dict recDict := Etc.makeDict([ "trash" : Marker.val ])

    Context.cur.proj.commit(Diff.make(targetRef, recDict))
    */
  }

  ** Overview:
  **  Confirm type pop-up box
  **
  ** Parameters:
  ** -'targetRef': The id of the record to be deleted.
  **
  ** Returns:
  **  None
  @Axon { meta =
  Str<|disKey: "fossViewExamplesExt::testConfirm"
       admin
       select
       confirm: {icon:"warn" disKey:"Confirm?" detailsKey:"Are you sure you want to confirm?"}
       |> }
  static Void testConfirm(Ref targetRef)
  {
    echo(targetRef)
    echo("Do Something here")
    /*
    Dict? mappingRec := Context.cur.proj.read("id==@${targetRef}")
    Dict recDict := Etc.makeDict([ "trash" : Marker.val ])

    Context.cur.proj.commit(Diff.make(targetRef, recDict))
    */
  }

  ** Overview:
  **  Things in here
  **
  ** Parameters:
  ** - 'projectEditSiteDict': Grid with a single dict, containing
  **    the tags to be altered.
  **
  ** Returns:
  **  None
  @Axon { meta =
  Str<|disKey: "fossViewExamplesExt::testActionOne"
       admin
       |> }
  static Void testActionOne(Grid testActionDict)
  {
    echo("Something here")
  }

  ** Overview:
  **  Confirm type pop-up box
  **
  ** Parameters:
  ** -'targetRef': The id of the record to be deleted.
  **
  ** Returns:
  **  None
  @Axon { meta =
  Str<|disKey: "fossViewExamplesExt::testActionTwo"
       admin
       |> }
  static Void testActionTwo(Grid testActionDict)
  {
    echo("Something here")
  }

  ** Overview:
  **  Confirm type pop-up box
  **
  ** Parameters:
  ** -'targetRef': The id of the record to be deleted.
  **
  ** Returns:
  **  None
  @Axon { meta =
  Str<|disKey: "fossViewExamplesExt::testActionThree"
       admin
       |> }
  static Void testActionThree(Grid testActionDict)
  {
    echo("Something here")
  }

  //Util funcs
  @Axon
  public static Grid readCsvFileTwo(Uri path, Str[] cols := ["user", "role", "color"]) {
    return Etc.makeListsGrid(null, cols, null, CsvInStream(Pod.find("testPodFanViewExt").file(path).in).readAllRows()[1..-1])
  }

}