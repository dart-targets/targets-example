/// All lines with starting with /// (no whitespace) will be removed from 
/// the version of this file that "targets get" downloads for students.
/// Any other comments (//, /*, or /**) will remain.
/// Indented /// comments will also remain.
/// The following message will be displayed to students unless you remove it.
/// 
// This file is used to run tests on your code before you submit it.
// To test your code, run "targets check" in the main directory
// Your instructor may run additional tests on your code after you submit it.
// Test results based on this file are not shared with your instructor,
// so changing it will not help your grade. If this file becomes corrupted,
// you will have to redownload the assigment template.
/// 
/// This imports the Target classes (ScoredTarget and TestTarget)
import 'helpers.dart';

/// Import necessary files to tests here, probably with a prefix, e.g.
import '../example.dart' as Example;
/// Use ../ as actual assignment code should be in the parent directory

/// Name displayed to students when running the autograder
/// This is not required, only the owner, id, and repo
/// are actually sent to server with student code
final String name = "Example Assignment for targets";

/// Your GitHub username or organization name
/// You'll have to log in with GitHub to access
/// submissions of this project
final String owner = "dart-targets";

/// Assignment id
/// Template should live at:
/// github.com/[owner]/targets-[id]
/// 
/// Students download template with:
/// targets get [owner]/[id]
/// 
/// Official targets assignments live at:
/// github.com/dart-targets/targets-[id]
/// and can be accessed with:
/// targets get [id]
/// You can have students download a version of these
/// assignments that will be uploaded with you as the owner
/// by having them use the following command instead:
/// targets get [owner]:[id]
final String id = "example";

/// This list should contain the files that should be submitted for grading.
final List<String> files = ["example.dart"];

/// This function should return a list of Target
/// objects that you want to be run for grading.
/// 
/// TestTarget does not count for points, but can be
/// helpful for students in debugging their code.
/// The test method of a TestTarget should return true or false.
/// 
/// ScoredTarget counts for the specified number of points.
/// The test method can return a number, true, or false.
/// Numbers count as the score on that target, true counts
/// as full credit, and false counts as no credit.
/// 
/// Tests that cause an error or return anything else will count as 
/// failed or no credit; errors will be displayed to students.
/// 
/// Students will be able to read this file, so don't include
/// completed implementations as part of your tests. You can
/// use a different tests.dart for tests you run on submissions.
List<Target> getTargets() {
    var fib = new ScoredTarget("Fibonacci", 3);
    fib.test = testFib;
    var fact = new ScoredTarget("Factorial", 3);
    fact.test = testFact;
    return [fib, fact];
}

int testFib() {
    int i = 0;
    if (Example.fib(5) == 5) i++;
    if (Example.fib(10) == 55) i++;
    if (Example.fib(40) == 102334155) i++;
    return i;
}

int testFact() {
    int i = 0;
    if (Example.fact(5) == 120) i++;
    if (Example.fact(10) == 3628800) i++;
    if (Example.fact(0) == 1) i++;
    return i;
}