package main

import (
	"github.com/astaxie/beego"
	"github.com/tyzbit/openvpn-web-ui/lib"
	_ "github.com/tyzbit/openvpn-web-ui/routers"
)

func main() {
	lib.AddFuncMaps()
	beego.Run()
}
