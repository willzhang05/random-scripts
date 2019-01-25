// This script is used for totaling up the time I work, based on the format given in the example file hours.txt,
// Input is given through stdin.
package main
import (
    "os"
    "fmt"
    "strings"
    "bufio"
    "time"
)

func main() {
    scanner := bufio.NewScanner(os.Stdin)
    var total time.Duration = 0
    var subtotal time.Duration = 0
    for scanner.Scan() {
        line := scanner.Text()
        line = strings.TrimSpace(line)
        if (strings.ContainsAny(line, "/")) {
            //const dayForm = "1/2"
            //t, _ := time.Parse(dayForm, line)
            if (subtotal.Minutes() != 0) {
                out := subtotal.String()
                out = out[:len(out)-2]
                fmt.Print(out)
                fmt.Println("\n")
            }
            fmt.Println(line)
            fmt.Println("---")
            subtotal = 0
        } else {
            tp := strings.Split(line, "-")
            const hmForm = "3:04pm"
            t1, _ := time.Parse(hmForm, tp[0])
            t2, _ := time.Parse(hmForm, tp[1])
            diff := t2.Sub(t1)
            if (!t2.After(t1)) {
                offset, _ := time.ParseDuration("24h")
                diff += offset
            }
            //fmt.Println(diff.Minutes())
            subtotal += diff
            total += diff
        }
    }
    fmt.Println("Total:")
    out := total.String()
    out = out[:len(out)-2]
    fmt.Println(out)
}
