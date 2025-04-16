source ../qtools/qcli.sh
source ../qtools/qdev.sh

function title() {
    local uppercase_title=${2^^}  
    qcli_message "EX$1 - $uppercase_title" success
}

function ex_001() {
    title "001" "Simple commands and output"
    echo "HOSTNAME: $(hostname)"
    whoami
    uptime -s
}

function ex_002() {
    title "002" "Second example"
    qdev_debug "doing..."
}