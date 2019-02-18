// This script is used for totaling up the time I work, based on the format given in the example file hours.txt,
// Input is given through stdin.
package main
import (
    "os"
    "strings"
    "bufio"
    "time"
    "encoding/csv"
)

func main() {
    scanner := bufio.NewScanner(os.Stdin)
    w := csv.NewWriter(os.Stdout)
    records := make([][]string, 1)
    records[0] = []string{"Date", "Time"}
    var index int = 1
    var total time.Duration = 0
    var subtotal time.Duration = 0
    var line string = ""
    for scanner.Scan() {
        line = scanner.Text()
        line = strings.TrimSpace(line)
        if (strings.ContainsAny(line, "/")) {
            records = append(records, make([]string, 2))
            if (subtotal.Minutes() != 0) {
                out := subtotal.String()
                out = out[:len(out)-2]
                records[index][1] = out
                index++
            }
            records[index][0] = line
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
            subtotal += diff
            total += diff
        }
    }
    if (subtotal.Minutes() != 0) {
        out := subtotal.String()
        out = out[:len(out)-2]
        records[index][1] = out
    }
    out := total.String()
    out = out[:len(out)-2]
    records = append(records, []string{"Total", out})
    w.WriteAll(records)
}
