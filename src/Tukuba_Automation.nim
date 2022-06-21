{.experimental: "caseStmtMacros".}

import std/[options, strformat]
import fusion/matching
import halonium

type
  ITFWebServices {.pure.} = enum
    kdb = "KdB"
    kdb_modoki = "KdBもどき"
    twins = "Twins"

proc kdb_boilerplate (search_query, url, textfield_selector, submit_button_selector, error_sentence: string) =
  let session = createSession(Chrome)
  session.navigate(url)

  case session.waitForElement(textfield_selector)
  of Some(@textfield_element):
    textfield_element.sendKeys(search_query)
  of None():
    stderr.writeLine error_sentence
    session.stop()
    quit(1)
  
  case session.waitForElement(submit_button_selector)
  of Some(@submit_button_element):
    submit_button_element.click()
  of None():
    stderr.writeLine error_sentence
    session.stop()
    quit(1)

func get_error_sentence (site_kind: ITFWebServices): string =
  result = &"何らかの問題が発生して{site_kind}のコンテンツを取得することに失敗しました"

proc kdb (search_query: string): int =
  const
    url = "https://kdb.tsukuba.ac.jp"
    textfield_selector = "#freeWord"
    submit_button_selector = """input[type="button"][value="検索"]"""
    error_sentence = get_error_sentence(ITFWebServices.kdb)
  kdb_boilerplate(search_query, url, textfield_selector, submit_button_selector, error_sentence)

proc kdb_modoki (search_query: string): int =
  const
    url = "https://make-it-tsukuba.github.io/alternative-tsukuba-kdb/"
    textfield_selector = "#keyword"
    submit_button_selector = "#submit"
    error_sentence = get_error_sentence(ITFWebServices.kdb_modoki)
  kdb_boilerplate(search_query, url, textfield_selector, submit_button_selector, error_sentence)

proc twins_notify (limit: int = 100000000): int =
  let session = createSession(Chrome, browserOptions=chromeOptions(args=["--headless"]))
  session.navigate("https://twins.tsukuba.ac.jp/")
  
  let tr_arrays = session.waitForElements("""//*[@id="keiji-portlet"]/table/tbody/tr""", XPathSelector)
  for index in 1..max(0, min(limit, tr_arrays.len)):
    case session.waitForElement(&"""//*[@id="keiji-portlet"]/table/tbody/tr[{index}]/td/a""", XPathSelector)
    of Some(@anchor_text):
      echo anchor_text.text
    of None():
      stderr.writeLine get_error_sentence(ITFWebServices.twins)
      session.stop()
      quit(1)
  session.stop()

when isMainModule:
  import cligen
  dispatchMulti(
    [kdb],
    [kdb_modoki],
    [twins_notify]
  )
