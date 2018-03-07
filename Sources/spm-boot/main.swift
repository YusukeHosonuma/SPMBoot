import SwiftShell
import Commander

let tool = command { (appName: String) in
    run(bash: "git clone https://github.com/YusukeHosonuma/SPMTemplate.git spm_template")
    run(bash: "mkdir \(appName)")
    run(bash: "cat ./spm_template/Makefile | sed -e 's/{{APP_NAME}}/\(appName)/' > \(appName)/Makefile")
    run(bash: "rm -rf spm_template")
    main.currentdirectory = appName
    run(bash: "swift package init --type executable")
    run(bash: "swift package generate-xcodeproj")
}
tool.run()
