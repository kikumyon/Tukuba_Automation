# Tukuba_Automation
筑波大学や大学に所属する有志が提供しているサービスに対する自動化アプリケーションです。


## KdB検索
```bash
Tukuba_Automation kdb --search_query:情報数学A
```

## KdBもどき検索
```bash
Tukuba_Automation kdb_modoki --search_query:情報数学A
```

## Twinsお知らせ取得
`limit`は任意のパラメータで、指定した件数を取得します。
```bash
Tukuba_Automation twins --limit:10
```

## インストール
Nimの環境を用意してください。choosenimを利用すると便利です。

```bash
curl https://nim-lang.org/choosenim/init.sh -sSf | sh
```

その後、Nimbleを用いてアプリケーションをインストールしてください。

```bash
nimble install https://github.com/momeemt/Tukuba_Automation
```

また、chromedriverに依存しているためそちらのインストールも必要です。以下はmacOSでのインストール手順です。

```bash
brew install chromedriver
```

## 作者
- [きくみょん](https://twitter.com/kiku_myon_itf)
