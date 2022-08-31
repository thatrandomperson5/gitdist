#https://api.github.com/repos/community/community/contents/README.md
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
  if defined(linux):
    echo "Operating System is GNU Linux"
  elif defined(windows):
    echo "Operating System is Microsoft Windows"
  elif defined(macosx):
    quit("OSX not supported.")
  


let resp = client.getContent("https://api.github.com/repos/thatrandomperson5/gamebin1/contents/dist")
let ou = "setup.sh"#evalContent(resp)
let api_resp = client.getContent(&"https://api.github.com/repos/thatrandomperson5/gamebin1/contents/dist/{ou}")
let node = parseJson(api_resp)
client.downloadFile(node["download_url"].getStr(), "rd.sh")