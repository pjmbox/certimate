package ui

import (
	"embed"

	"github.com/pocketbase/pocketbase/apis"
)

//go:embed placeholder.txt
var distDir embed.FS

var DistDirFS = apis.MustSubFS(distDir, "dist")
