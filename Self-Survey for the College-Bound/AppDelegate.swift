//
//  AppDelegate.swift
//  Self-Survey for the College-Bound
//
//  Created by Russell on 15/12/2015.
//  Copyright © 2015 Russell Slighton. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var introWindow: NSView!
    @IBOutlet var questionsWindow: NSView!
    @IBOutlet var totalsWindow: NSView!
    @IBOutlet var descriptionsWindow: NSView!
    
    @IBOutlet var questionTitle: NSTextFieldCell!
    @IBOutlet var questionChoices: NSMatrix!
    
    @IBOutlet var totalsText: NSTextFieldCell!
    
    @IBOutlet var descriptionTitle: NSTextFieldCell!
    @IBOutlet var descriptionText: NSTextFieldCell!

    
    var currentFrame: Int = 0;
    
    let firstQuestionFrame: Int = 1;
    let numQuestions: Int = 80;
    
    let firstTotalsFrame: Int = 81;

    let numDescriptions: Int = 12;
    let firstDescriptionFrame = 82;
    let maxFrames = 92;
    
    var oldOrigin: CGPoint = CGPoint();
    
    
    var categories: [category] = [
        category(name: "Interpreting Your Self-Survey Scores", description: "The survey you just completed and the interpretation that follows in the next worksheet are intended to encourage you to think about yourself as a college student. By looking at your scores and seeing what they mean within each category, you should glean insight about yourself–your attitudes, strengths and weaknesses, aspirations, and fears. This information will be essential to your college planning process.\nThere is no definitive answer to what a specific score in a category means for you. in the preceding sections describing each category, you saw works like \"scores in the mid 30’s or higher suggest...\" and \"lower scores suggest...\" This lack of specificity is purposeful because these scores can be evaluated in many ways. It is up to you to read the descriptions and to determine what, if any, meaning a particular score has for you. Your score in one category might give you insight into something important, and your score in another category might be less meaningful.\nFinding meaning in high scores is a bit easier than doing so for lower scores, but remember, there is no hard-and-fast interpretation of a lower score. In the category School Enthusiasm, for example, the first paragraph interprets scores \"in the mid 30’s or above.\" The next paragraph is an analysis of the meaning of \"lower scores,\" i.e., a score from 0 to the mid 30’s.\n Keep in mind that your score-whether higher or lower-is on a continuum. Thus, your interpretation of what your score means in this area will vary if your score was a single digit or in the teens versus the high 20’s or lower 30’s. In other words, the description associated with a low score might be more true of you if your score was a 6 as compared with a 29. \n Finally, don’t get hung up on the numerical aspects of the interpretation of your scores. The goal here is to provide information that can serve as a springboard in your quest to find colleges that are a good match for you. \"High\" and \"low\" numbers are less significant than using the information here to come up with match colleges that correspond with your attributes and beliefs."),
        category(name: "1 - School Enthusiasm", description: "If you scored in the mid 30’s or higher, you probably feel comfortable with the tasks and central qualities of school. In general, you like attending classes and have positive feelings about the academic nature of school. \nIf your score is lower here, there are several possible interpretations. You may enjoy some of the social features of school more than the actual classes, teachers, and classroom information. You may not have found school to be a successful academic experience, and your struggle with school may affect your attitude toward it. Your school attitude may impact your feelings about planning for college, your willingness to enter a challenging college environment, the level of competitiveness you prefer, as well as your motivation to stay in school. Do you have the motivation to be successful in college? You may not have enjoyed high school because particular characteristics of your school may not have been rights for you. If that is the case, you have a chance to choose the college that provides the kind of environment that suits you. Your analysis of the factors that matter to you in a college will be particularly important in finding a college you can be excited about attending. You also may want to consider these questions: Is the time right to enter college? Would you benefit from a year of travel, work, or some other activity before entering college?"),
        category(name: "2 - Participant Learner", description: "If your score in this category is in the mid 30’s or higher, you likely want to take an active, rather than passive, approach to learning. You are not comfortable merely taking notes and regurgitating the teacher’s lectures–you want to get involved! Your normally do the homework your teachers assign, not because you have to, but because it helps you learn. Likely, you participate in class discussion, enjoy it, and learn from your peers. You read the textbooks and may read additional material on a topic that interests you. Because learning and understanding are so important to you, you are assertive in asking questions to teachers and fellow students. You likely will be most comfortable at colleges where professors are readily available and lecture classes are not huge. In addition, you will want opportunities for discussions and seminars as part of your college experience. High scorers should consider smaller colleges.\nIf you in the lower 30’s and below, you have several factors to consider. You may be interested in and committed to learning but prefer to learn quietly and deliberately rather than participate verbally in class. Course lectures, reading, and out-of-class assignments are normally sufficient for you to learn the material. For you, class size probably will not be as significant a factor. Lower scores here suggest that you may not mind being in a large class, and a bigger university would meet your needs."),
        category(name: "3 - Affection for Knowledge", description: "If you scored in the 40’s or higher here, the life of the mind is exciting to you. You may read widely on a variety of topics, and you enjoy learning for the sake of learning, not because you may get a good grade. You enjoy talking about ideas and philosophies and trading perspectives with others. Students with high scores here should seek academic challenges and colleges that will stimulate their minds. Keep in mind, however, that \"big name\" colleges are not the only ones that provide intellectual stimulation and that there are dozens of colleges outside the Ivy League Athletic Conference that are intellectually challenging. For some students, nontraditional colleges that do not stress grades may be worth considering because they can offer freedom to follow your curiosity wherever it takes you, without worrying about a GPA.\nLower scores suggest that you are less comfortable with intellectual ideas and concepts. Perhaps you haven’t yet have been exposed to compelling topics, issues, or ideas that excite you. You may not have had experiences that gave you a love of learning. You will want to be cautious about applying to a college that expects you to start your first semester with a serious academic focus. You may want to use college as a place to try classes or subjects with which you are unfamiliar; you might be pleasantly surprised by how fascinating a new subject can be. On the other hand, if you having a few specific areas that interest you, you might prefer a college where the classes are more directly related or applicable to these areas."),
        category(name: "4 - Basic Academic Skills", description: "If you scored in the 40’s or higher, you are likely to have the skills particularly valuable to success in college–writing, reading, note-taking, and prioritizing. You may find college a bit less demanding than you expected, thanks to the strength of your academic skills. There are several considerations for the student with a lower score in this category. You may want to search out colleges where some extra assistance from teachers is readily available, and where you can find resources and opportunities to develop your study skills. When choosing classes, think carefully about the workload involved–reading requirements, term papers, and other assignments–especially during freshman year. However, lower scores in this category also may reflect a student who is overly critical of personal study skills but fully capable of handling the academic demands of typical freshmen courses."),
        category(name: "5 - Independence", description: "The questions in this category focused on your willingness to make your own plans, follow your instincts, and act independently of others. Are you ready to make the decisions college students face every day–choosing classes, setting your own schedule, negotiating with roommates, determining your own social \"do’s and don’ts\"? Students who score in the 40’s or higher will likely be comfortable with such freedom. Having already shown that you take charge of your life, you are less apt to act irresponsibly while away from home and less in need of others’ approval before making important decisions. In addition, given your self-sufficiency, you may not need the \"excitement\" of a college in a large city because even at an isolated college locale you will be able to generate activities and create a social network.\nIf your scores were lower, you may still be transitioning from dependence to independence. Rather than be overwhelmed by choices your freshman year, you may want some decisions made for you. Some colleges provide more structure, such as a core curriculum or series of required classes, and offer a range of planned activities and events to attend. You may also need to work on self-discipline and practice assuming responsibility for your decisions and their consequences. A smaller college could provide the perfect environment for gradually building your self-confidence and independence."),
        category(name: "6 - Career Orientation", description: "A score of 40 or higher in this category indicates that you view college as a means to an end, a way to achieve other lifetime goals and attain a position of professional or vocational competence. Because you see college as a vehicle for vocational preparation, you may want to explore professionally related majors and seek colleges where you’ll be able to keep \"on track\" toward meeting the demands of your chosen career. As you consider colleges, review the general educational requirements that students must fulfill. Too many required humanities courses, for example, may be less appealing to you than the freedom to concentrate on subjects of interest early on.\nA lower score in this category is quite common and reflects a student who wants a general, broad-based college education. You are likely very open to the wide variety of learning experiences that college may bring. For you, college may be a time for academic experimentation, a place where you can test a variety of ideas and career paths. You may want to explore traditional liberal art colleges with many options in the humanities, social sciences, and science. Whether it’s liberal arts or something else, you are on track to discover your likes and dislikes in college."),
        category(name: "7 - Social Consciousness", description: "Scores in the high 30’s and above suggest you care about the world and may not be satisfied with the status quo. Your concern about the state of the world may influence your life and lead you to seek outlets for your compassion and empathy. Colleges that might appeal to you include those with political action committees, volunteer opportunities, or other activities geared to reaching out beyond the bounds of campus. Some colleges place an explicit value on recognizing one’s responsibility to the world.\nLower scores here could have several connotations. You may not be sensitive to or aware of the numerous opportunities for social responsibility. You may be comfortable pursuing your individual goals, or you may have other priorities. A low score doesn’t mean you don’t have a social conscience! It may merely reflect that, at present, the drive to help others is less strong than other motivators in your life."),
        category(name: "8 - Self-Understanding", description: "A score in the high 30’s and above suggests that you are in touch with your own good and bad qualities and are accepting of yourself. You are fairly comfortable with who you are and don’t let others direct your thoughts and behaviors. This self-awareness will aid you in adjusting to college and in making decisions once you enroll. You will be less prone to modulating your behavior to impress others. You are comfortable with your abilities and personality and such comfort will enable you to make mature decisions in college. If your score was lower here, you may be just beginning to know yourself. Teenagers’ perceptions of themselves are usually heavily influenced by peers. Is it possible that you are overly responsive to the wishes and demands others have for you? Your focus on pleasing others may override your personal wants and needs. You might find it easier to acquire self-understanding and confidence at a smaller, more-supportive college than at an enormous university. Look at schools where you’ll be a big fish in a small pond. Lower scores are not necessarily bad! Self-understanding is a skill that is a lifetime in the making."),
        category(name: "9 - Academic/Social Balance", description: "If you scored in the high 30’s and above, both academics and extracurricular experiences are priorities for you. You will want to choose a college where you can have a balanced life, where you can pursue your studies, participate in sports or other activities, and still have some time for yourself. Colleges known for a \"work hard/play hard\" philosophy may appeal to you, but consider your college choices carefully-being certain you are not getting in \"over your head.\" You will want to choose a college where you are academically similar to the majority of students, where you are as likely as anyone else to understand the material in your classes, where you are able to spend about the same amount of time studying and still have a life outside of the classroom. In researching colleges, look carefully at the characteristics of students who enroll. What were their grade point averages? Test scores? Did they take courses in high school fairly similar to the ones you have chosen.\nThere are several ways to interpret a lower score in this category. Perhaps you are focused more on academics and want colleges to be all about learning. Or maybe you value your social life more than your studies and want college to be all about having fun. If academics are your highest or even your only priority, you may be comfortable at a college that is academically intense. If social experiences matter most, you will want to consider colleges where you will have time to get involved in campus activities and time for your friends."),
        category(name: "10 - Eagerness for College", description: "Scores in the high 30’s or above signal that you anticipate college in a favorable way and are looking forward to the collegiate experience. Adjustment will likely be easy because your enthusiasm will be a great asset in learning to master college life. Although you may have some concerns about college, your aptitude is generally positive. Because you played a primary role in deciding to attend college, you likely have specific goals to make the most of your college years.\n Lower scores can be interpreted in several ways. Just because you scored low here doesn’t mean that you are not \"college material\" or are dreading the college experience. Eagerness for college tends to ebb and flow during the high school years. But a lower score is worth thinking about. Are you motivated to attend college? You will want to give special consideration to the ways you can make college college a satisfying and productive experience. Some fears about college–such as leaving home and being independent– are perfectly normal. If your score was lower in this category, involving yourself in the planning and decision-making processes will help you feel more in control and less like you are being pushed into college. But think carefully about, and seek assistance with, the timing and the nature of your college years."),
    ];


    var questions: [question] = [
        question(question: "1 - There are several social issues or causes that I care about deeply.", type: 7),
        question(question: "2 - I often participate in class discussions.", type: 2),
        question(question: "3 - I enjoy reading.", type: 4),
        question(question: "4 - I feel I know myself pretty well.", type: 8),
        question(question: "5 - I’m excited for my college years to begin.", type: 10),
        question(question: "6 - There are at least three things I can do better than others around me and at least three things others can do better.", type: 8),
        question(question: "7 - If I don’t understand something in class, I typically feel comfortable asking my teacher a question.", type: 2),
        question(question: "8 - School is fun.", type: 1),
        question(question: "9 - I normally am enthused about the classes I am taking.", type: 1),
        question(question: "10 - I can identify at least one school subject or topic about which I am truly passionate.", type: 3),
        question(question: "11 - I believe one of the most important reasons to go to college is to get a job.", type: 6),
        question(question: "12 - I want to organize myself so I have time for both homework and for out-of-class activities.", type: 9),
        question(question: "13 - I love learning for the sake of learning.", type: 3),
        question(question: "14 - If I want to do something on a Saturday afternoon, I usually don’t need my friends to do it with me.", type: 5),
        question(question: "15 - I am satisfied with my listening skills in my classes.", type: 4),
        question(question: "16 - I can truly say I enjoy school. ", type: 1),
        question(question: "17 - I will enjoy college a lot more if I can see how my classes apply to real life.", type: 6),
        question(question: "18 - I am interested in and feel comfortable talking about current events.", type: 7),
        question(question: "19 - Going to college means growing, learning, changing, in other words, it is not just \" the thing to do.\"", type: 10),
        question(question: "20 - I enjoy learning things on my own (and not just for a class). ", type: 3),
        question(question: "21 - I enjoy hearing and discussing other students’ ideas in class.", type: 2),
        question(question: "22 - I see college more as a time for preparing for a career than for discovering my academic interests.", type: 6),
        question(question: "23 - A college with a blend of studying and socializing is important to me (even if I’d need to sacrifice my grades a little bit to enjoy college).", type: 9),
        question(question: "24 - Even if my friends weren’t there, I would still like school.", type: 1),
        question(question: "25 - My friends and I enjoy discussing concepts and new ideas.", type: 3),
        question(question: "26 - My parents don’t have to remind me to study or do my homework.", type: 5),
        question(question: "27 - My English teachers commend me on the quality of my papers and written assignments.", type: 4),
        question(question: "28 - Making others happy is one of my primary goals.", type: 7),
        question(question: "29 - Most of the time, Ii feel others understand me.", type: 8),
        question(question: "30 - On most homework assignments, I do everything that needs to be done.", type: 1),
        question(question: "31 - I am comfortable making some decisions without my parents’ input.", type: 5),
        question(question: "32 - I want to commit at least part of my life to bettering society.", type: 7),
        question(question: "33 - Unless I have decided on a career, it will be hard to choose a college.", type: 6),
        question(question: "34 - On most days, I look forward to going to school. ", type: 1),
        question(question: "35 - Assuming there was a campus speaker on an interesting topic I knew little about, I’d likely attend.", type: 3),
        question(question: "36 - I am the sort of person who is comfortable going outside of my comfort zone.", type: 5),
        question(question: "37 - There is more to college than going to class and doing homework.", type: 9),
        question(question: "38 - I’m usually good at prioritizing my time to get my studying done.", type: 4),
        question(question: "39 - I usually find class discussions stimulating and interesting.", type: 2),
        question(question: "40 - Learning about many different academic subjects–history, English, math and so on–is interesting to me.", type: 3),
        question(question: "41 - I usually initiate my own social activities.", type: 5),
        question(question: "42 - I tend to lose interest if class material isn’t relevant to real world.", type: 6),
        question(question: "43 - By late summer, I’m eager to go back to school.", type: 1),
    question(question: "44 - The college philosophy \"work hard/play hard\" appeals to me.", type: 9),
        question(question: "45 - I see many benefits in going to college.", type: 10),
        question(question: "46 - I seek out ways to demonstrate my concern for political, national, and/or international issues.", type: 7),
        question(question: "47 - I seldom get \"tongue-tied\" when trying to express myself.", type: 4),
        question(question: "48 - Taking lots of different subjects in college (English, math, history, etc.) is not as appealing to me as focusing on those subjects I like.", type: 6),
        question(question: "49 - I usually go beyond class requirements, not because I have to, but because I am interested in the class.", type: 3),
        question(question: "50 - I like colleges that emphasize pre-professional programs (pre-med, pre-law, pre-business, etc.).", type: 6),
        question(question: "51 - I want to go to college as much as my parents want me to go.", type: 10),
        question(question: "52 - It is easy for me to identify my favorite class in school.", type: 1),
        question(question: "53 - I When I know the answer to a question in class, I usually raise my hand.", type: 2),
        question(question: "54 - I do not feel pushed into going to college.", type: 10),
        question(question: "55 - I am not afraid to take a position with which others will disagree.", type: 5),
        question(question: "56 - One of my top goals is to develop a philosophy of life.", type: 7),
        question(question: "57 - One of my prime reasons to go to college is to meet people who will be influential in helping me get a job later in life.", type: 6),
        question(question: "58 - I like a challenge, but I don’t want to be academically overwhelmed in college.", type: 9),
        question(question: "59 - I can explain why I want to go to college.", type: 10),
        question(question: "60 - I like teachers who encourage me to think about how academic subjects interrelate.", type: 3),
        question(question: "61 - I am ready to begin thinking about my future and planning for college.", type: 10),
        question(question: "62 - In college, it will be important that I have time to spend with my friends.", type: 9),
        question(question: "63 - Learning by discussion is more fun than learning by listening to a teacher lecture.", type: 2),
        question(question: "64 - I keep up with news, politics and international affairs via the newspaper, Internet, radio, or podcasts.", type: 7),
        question(question: "65 - It is not that important for me to look and act like my friends.", type: 5),
        question(question: "66 - When I walk into class, I feel prepared and ready to share what I know.", type: 2),
        question(question: "67 - Thinking about one of my weaknesses doesn’t make me feel uncomfortable.", type: 8),
        question(question: "68 - The thought of going to college doesn’t scare me.", type: 10),
        question(question: "69 - I’m pretty good at making decisions.", type: 8),
        question(question: "70 - Writing essays and papers is relatively easy for me.", type: 4),
        question(question: "71 - Building good relationships with teachers is important to me. ", type: 2),
        question(question: "72 - I am willing to study hard in college, but I also want time to be involved in activities.", type: 9),
        question(question: "73 - As far as intelligence, I want the other kids at my college to be similar to me.", type: 9),
        question(question: "74 - I can easily identify the special qualities my friends like about me.", type: 8),
        question(question: "75 - If asked, I could easily list two or three words that describe me.", type: 8),
        question(question: "76 - My note-taking skills are good.", type: 4),
        question(question: "77 - I believe I know how to motivate myself to be successful in school.", type: 8),
        question(question: "78 - I am comfortable with my reading speed and comprehension.", type: 4),
        question(question: "79 - I seldom get homesick when I’m away from home for a few days.", type: 5),
    question(question: "80 - I enjoy volunteering my time to help people in need.", type: 7)];

    
    
    
    
    
    

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        window.contentView = introWindow
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    @IBAction func forwardIntro(sender: NSButton){
        currentFrame++;
        changeContentView(questionsWindow);
        nextQuestion()
    }
    
    @IBAction func forwardQuestion(sender: NSButton){
        currentFrame++;
        
        if(currentFrame == firstTotalsFrame){
            changeContentView(totalsWindow);
            saveChoice(currentFrame-firstQuestionFrame-1)
            displayTotals();
            oldOrigin = window.frame.origin;
        }
        else{
            saveChoice(currentFrame-firstQuestionFrame-1);
            nextQuestion();
        }
    }
    
    @IBAction func forwardTotal(sender: NSButton){
        currentFrame++;

        changeContentView(descriptionsWindow);
   window.setFrame(NSRect(origin: window.frame.origin, size: CGSize(width: 480, height: 620)), display: true);        showDescription();

    }
    
    @IBAction func forwardDescripton(sender: NSButton){
        
        if(currentFrame < maxFrames){
            currentFrame++;

            showDescription();
        }
    }
    
    @IBAction func backwardQuestion(sender: NSButton){
        currentFrame--;
        if(currentFrame == firstQuestionFrame - 1){
            changeContentView(introWindow);
            
        }
        else{
            saveChoice(currentFrame);
            nextQuestion()
        }

    }
    
    @IBAction func backwardTotal(sender: NSButton){
        currentFrame--;
        if(currentFrame == firstTotalsFrame - 1){
            changeContentView(questionsWindow);
        }
    }
    
    @IBAction func backwardDescription(sender: NSButton){
        currentFrame--;
        if(currentFrame == firstDescriptionFrame-1){
            changeContentView(totalsWindow);
            window.setFrame(NSRect(origin: oldOrigin, size: CGSize(width: 480, height: 360)), display: true);

        }
        else{
            showDescription();
        }
    }
    
    func changeContentView(view: NSView){
        window.contentView = view;
    }
    
    func nextQuestion(){
        questionTitle.title = questions[currentFrame-firstQuestionFrame].question;
        questionChoices.selectCellWithTag(questions[currentFrame-firstQuestionFrame].answer);

    }
    
    func saveChoice(question: Int){
        questions[question].answer = questionChoices.selectedTag();

    }
    
    func displayTotals(){
        var schoolEnthusiasm: Int = 0;
        var participantLearner: Int = 0;
        var affectionForKnowledge: Int = 0;
        var basicAcademicSkills: Int = 0;
        var independence: Int = 0;
        var careerOrientation: Int = 0;
        var socialConsciousness: Int = 0;
        var selfUnderstanding: Int = 0;
        var academicSocialBalance: Int = 0;
        var eagernessForCollege: Int = 0;
        
        for question in questions{
            switch question.type{
            case 1:
                schoolEnthusiasm += question.answer;
            case 2:
                participantLearner += question.answer;
            case 3:
                affectionForKnowledge += question.answer;
            case 4:
                basicAcademicSkills += question.answer;
            case 5:
                independence += question.answer;
            case 6:
                careerOrientation += question.answer;
            case 7:
                socialConsciousness += question.answer;
            case 8:
                selfUnderstanding += question.answer;
            case 9:
                academicSocialBalance += question.answer;
            case 10:
                eagernessForCollege += question.answer;
            default:
                print("switch broke")
            
        }
    }
        let text: String =  "School Enthusiams: " + String(schoolEnthusiasm) + "\n" +
                            "Participant Learner: " + String(participantLearner) + "\n" +
                            "Basic Academic Skills: " + String(affectionForKnowledge) + "\n" +
                            "Independence: " + String(independence) + "\n" +
                            "Career Orientation: " + String(careerOrientation) + "\n" +
                            "Social Conciousness: " + String(socialConsciousness) + "\n" +
                            "Self-Understanding: " + String(selfUnderstanding) + "\n" +
                            "Academic/Social Balance: " + String(academicSocialBalance) + "\n" +
                            "Eagerness for College: " + String(eagernessForCollege) + "\n";
        
        totalsText.title = text;
        
    }
    
    func showDescription(){
        descriptionTitle.title = categories[currentFrame-firstDescriptionFrame].name;
        descriptionText.title = categories[currentFrame-firstDescriptionFrame].description;

    }
    
}


