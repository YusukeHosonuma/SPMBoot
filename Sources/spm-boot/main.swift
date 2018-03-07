import SwiftShell
import Commander
import Foundation

func exe(_ bash: String) {
    print("> \(bash)")
    let result = run(bash: bash)
    if result.exitcode != 0 {
        print("Failed...")
        exit(-1)
    }
}

let tool = command { (appName: String) in
    // TODO: tempディレクトリにcloneしたほうが良い＋shallow cloneのほうが好ましい
    exe("git clone https://github.com/YusukeHosonuma/SPMTemplate.git .spm_template")
    exe("mkdir \(appName)")
    exe("cat ./.spm_template/Makefile | sed -e 's/{{APP_NAME}}/\(appName)/' > \(appName)/Makefile")
    exe("rm -rf .spm_template")
    main.currentdirectory = appName
    exe("swift package init --type executable")
    exe("swift package generate-xcodeproj")
    print("")
    print("Successful generate your app '\(appName)'.")
}
tool.run()
