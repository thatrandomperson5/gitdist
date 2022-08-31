#GDIST
import std/httpclient
import std/json
import std/strformat
import std/strutils
import std/tables
import std/os


proc evalContent(rp: string): Table[string, Table[string, string]] =
  let js = rp.parseJson()
  var lst: seq[string]
  for x in js:
    lst.add(x["name"].getStr())
  var dataset: Table[string, Table[string, string]] = {"macosx": {"cr": "cr"}.toTable, "linux": {"cr":"cr"}.toTable, "windows": {"cr": "cr"}.toTable}.toTable
  for x in lst:
    if x.endswith(".sh"):
      dataset["macosx"]["setup"] = x
      dataset["linux"]["setup"] = x
    elif x.endswith(".bat"):
      dataset["windows"]["setup"] = x
    elif x.endswith(".bin"):
      dataset["linux"]["bin"] = x
    elif x.endswith(".bin.gz"):
      dataset["linux"]["bin"] = x
      dataset["linux"]["binzipped"] = "true"
    elif x.endswith(".exe"):
      dataset["windows"]["env"] = x
    elif x.endswith(".gz"):
      dataset["linux"]["env"] = x
      dataset["linux"]["envzipped"] = "true"
    else:
      dataset["linux"]["env"] = x
  return dataset

  
proc get_dist(url: string, mapping: Table[string, Table[string, string]], prio: string="bin", run_setup: bool=true) =
  var tg: string
  if defined(linux):
    tg = "linux"
  elif defined(windows):
    tg = "windows"
  elif defined(macosx):
    quit("OSX not yet supported.") #Remove when supported
    tg = "macosx"
  else:
    quit("Your os is not supported. If you want it to be supported please go to [https://github.com/thatrandomperson5/gitdist/issues/new/choose] and open a OS-support issue")
  var ourl: string
  if not mapping.hasKey(tg):
    quit(&"This project does not support your os: {tg}")
  var dwn_out: string
  if mapping[tg].hasKey(prio):
    let item = mapping[tg][prio]
    if getAppDir().endswith("/gitdist"): #For release versions
      dwn_out = &"{getAppDir()}/files/{item}"
    else: #For debugging
      dwn_out = &"{getAppDir().parentDir()}/gitdist/files/{item}"
    if prio == "bin":
      dwn_out = &"/bin/{item}"
    ourl = &"https://api.github.com/repos/{url}/contents/dist/{item}"
  else:
    var notprio: string = "env"

    if prio == "env":
      notprio = "bin"
    let item = mapping[tg][notprio]
    if getAppDir().endswith("/gitdist"): #For release versions
      dwn_out = &"{getAppDir()}/files/{item}"
    else: #For debugging
      dwn_out = &"{getAppDir().parentDir()}/gitdist/files/{item}"
    if notprio == "bin":
      dwn_out = &"/bin/{item}"
    ourl = &"https://api.github.com/repos/{url}/contents/dist/{item}"
  var client = newHttpClient()
  let api_resp = client.getContent(ourl)
  let node = parseJson(api_resp)
  echo &"Downloading to: {dwn_out}"
  client.downloadFile(node["download_url"].getStr(), dwn_out)
  if dwn_out.parentDir() == "/bin":
    if mapping[tg].hasKey("binzipped"):
      discard execShellCmd(&"gzip -d {dwn_out}")
  else:
    if mapping[tg].hasKey("envzipped"):
      discard execShellCmd(&"gzip -d {dwn_out}")
  if run_setup:
    if mapping[tg].hasKey("setup"):
      let item = mapping[tg]["setup"]
      let surl = &"https://api.github.com/repos/{url}/contents/dist/{item}"
      let rp = client.getContent(surl)
      let js = parseJson(rp)
      client.downloadFile(js["download_url"].getStr(), &"{dwn_out.parentDir()}/{item}")
      if item.endswith(".sh"):
        discard execShellCmd(&"sh {dwn_out.parentDir()}/{item}")
      else:
        discard execShellCmd(&"{dwn_out.parentDir()}/{item}")
       
      
#
    
#const target = "thatrandomperson5/gamebin1"
#let resp = client.getContent(&"https://api.github.com/repos/{target}/contents/dist")
#let ou = evalContent(resp)
#get_dist(target, ou)


#CLI

proc gitdist(priority: string="bin", setup: bool=true, args: seq[string]) =
  var target: string
  try:
    target = args[0]
  except IndexDefect as e:
    quit("Missing required argument <target>: gitdist [options] <target>")
  var client = newHttpClient()
  echo "Searching..."
  let resp = client.getContent(&"https://api.github.com/repos/{target}/contents/dist")
  let ou = evalContent(resp)
  echo "Downloading..."
  get_dist(target, ou, priority, setup)
  echo "~Installed~"

import cligen
dispatch gitdist, help={
                        "priority": "Options: bin, env", 
                        "setup": "Options: true, false",
                        "help": "brings up this menu. Get further help at https://github.com/thatrandomperson5/gitdist",
                        }