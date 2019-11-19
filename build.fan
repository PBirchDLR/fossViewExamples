#! /usr/bin/env fan

using build

**************************************************************************
** Build: fossViewExamplesExt
**************************************************************************
public class Build : BuildPod {
  public new make() {
    this.podName = "fossViewExamplesExt"
    this.summary = "Example Fantom Views for SkySpark"
    this.version = Version("3.0.22")
    this.meta    = [
                     "license.name" : "Commercial",
                     "skyarc.icons" : "true"
                   ]
    this.depends = [
                     // Standard Dependencies
                     "axon 3.0",
                     "concurrent 1.0",
                     "dom 1.0",
                     "domkit 1.0",
                     "folio 3.0",
                     "haystack 3.0",
                     "obixExt 3.0",
                     "graphics 1.0",
                     "skyarcd 3.0",
                     "sparkExt 3.0",
                     "sys 1.0",
                     "ui 3.0",
                     "util 1.0"
                   ]
    this.srcDirs = [
                     `fan/`,
                     `fan/ui/`
                   ]
    this.resDirs = [
                     `lib/`,
                     `lib/funcs/`,
                     `lib/views/`,
                     `lib/funcs/two/`,
                     `lib/funcs/three/`,
                     `res/`
                   ]
    this.index   = [
                     "skyarc.ext" : "fossViewExamplesExt::FossViewExamplesExt",
                     "skyarc.lib" : "fossViewExamplesExt::FossViewExamplesLib"
                   ]
  }
}