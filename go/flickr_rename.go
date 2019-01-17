// This script is used to rename downloaded photos in zip files from Flickr to their original names.
package main
import (
    "os"
    "log"
    "fmt"
    "strings"
    "path/filepath"
)

func main() {
    if len(os.Args) < 2 {
        fmt.Println("No path to downloaded images provided.")
        os.Exit(1)
    }
    if _, err := os.Stat(os.Args[1]); err != nil {
        if os.IsNotExist(err) {
            fmt.Println("Directory does not exist.")
        } else {
            fmt.Println("Directory is invalid.")
        }
        os.Exit(1)
    }
    err := os.Chdir(os.Args[1]);
    if err != nil {
        log.Fatal(err)
    }
    files, err := filepath.Glob("*")
    if err != nil {
        log.Fatal(err)
    }
    new_fnames := make([]string, len(files))
    for _, fname := range files {
        split_ext := strings.Split(fname, ".")
        if len(split_ext) == 2 {
            split_fname := strings.Split(split_ext[0], "_")
            new_fname := strings.ToUpper(split_fname[0]) + "." + split_ext[1]
            fmt.Println(fname + " -> " + new_fname)
            err := os.Rename(fname, new_fname)
            if err != nil {
                log.Fatal(err)
            }
            new_fnames = append(new_fnames, new_fname)
        }
    }
}
