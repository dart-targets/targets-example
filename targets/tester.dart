/// This file is executed by targets in order to test student code.
/// Changes to this file will not be shared with students as
/// targets will insert its own version of this file,
/// not the one included in your GitHub repository.
/// 
/// Message displayed to students:
// targets uses this file to test your code
// Changing it will not improve your grade
// It will only make it harder for you to run tests

import 'dart:io';
import 'tests.dart' as Tests;

main(){
    runTests();
}

void runTests(){
    try{
        print(Tests.name, BLUE);
        print("");
    }catch(e){

    }
    List<Target> targets = Tests.getTargets();
    num score = 0;
    num maxPoints = 0;
    bool allPassed = true;
    for(Target t in targets){
        if(t is ScoredTarget){
            maxPoints += t.points;
            var s = 0;
            try{
                s = t.test();
            }catch(e){
                String error = e.toString().replaceAll("\n"," ");
                print("Test ${t.name} failed with error: $error", RED);
            }
            if(s is bool){
                if(s){
                    s = t.points;
                    score += t.points;
                }else s = 0;
            }else if(s != null) score += s;
            String extra = "";
            if(t.error!=null){
                extra = "- ${t.error}";
            }
            print("${t.name}: $s/${t.points} $extra");
        }else if(t is TestTarget){
            bool result = false;
            try{
                result = t.test();
            }catch(e){
                String error = e.toString().replaceAll("\n"," ");
                print("Test ${t.name} failed with error: $error", RED);
            }
            String extra = "";
            if(t.error!=null){
                extra = "- ${t.error}";
            }
            if(result){
                print("${t.name}: Passed $extra");
            }else{
                print("${t.name}: Failed $extra");
                allPassed = false;
            }
        }
    }
    if(maxPoints>0){
        if(score>=maxPoints) print("Total Score: $score/$maxPoints", GREEN);
        else print("Total Score: $score/$maxPoints", RED);
        if(!allPassed) print("Some Additional Tests Failed", RED);
    }else{
        if(allPassed) print("All Tests Passed!", GREEN);
        else print("Some Tests Failed", RED);
    }
}

const String PLAIN = "plain";
const String GREEN = "green";
const String RED = "red";
const String BLUE = "blue";

Function print = (String str, [String type=PLAIN]){
    if(type==PLAIN){
        stdout.writeln(str);
    }else if(type==RED){
        stdout.writeln("\u001b[0;31m"+str+"\u001b[0;0m");
    }else if(type==GREEN){
        stdout.writeln("\u001b[0;32m"+str+"\u001b[0;0m");
    }else if(type==BLUE){
        stdout.writeln("\u001b[0;34m"+str+"\u001b[0;0m");
    }
};