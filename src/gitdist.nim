#GDIST
import std/httpclient
import std/distros
import std/json
import std/strformat
import std/strutils
import std/tables

var client = newHttpClient()

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

  
proc get_dist(mapping: Table[string, Table[string, string]], prio: string="bin", run_setup: bool=true) =
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

let resp = client.getContent("https://api.github.com/repos/thatrandomperson5/gamebin1/contents/dist")
let ou = "setup.sh"#evalContent(resp)
let api_resp = client.getContent(&"https://api.github.com/repos/thatrandomperson5/gamebin1/contents/dist/{ou}")
let node = parseJson(api_resp)
client.downloadFile(node["download_url"].getStr(), "rd.sh")