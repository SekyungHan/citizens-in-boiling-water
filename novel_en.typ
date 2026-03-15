// Citizens in Boiling Water — Sekyung Han
// Typst novel manuscript (English translation)

#set text(font: "Liberation Serif", size: 11pt, lang: "en")
#set page(paper: "a4", margin: (x: 2.5cm, y: 3cm))
#set par(leading: 1.2em, first-line-indent: 1em)

// ─── Cover ───

#page(margin: 0pt)[
  #place(top + left, image("../img_cover.png", width: 100%, height: 100%))
  #place(top + left, rect(width: 100%, height: 100%, fill: rgb("#000000").transparentize(45%)))
  #align(center)[
    #v(9cm)
    #text(font: "Liberation Serif", size: 40pt, weight: "bold", fill: white)[Citizens in Boiling Water]
    #v(0.8cm)
    #text(font: "Liberation Serif", size: 14pt, fill: rgb("#ffffff").transparentize(15%))[A warning from the age of artificial intelligence]
    #v(3cm)
    #text(font: "Liberation Serif", size: 16pt, fill: white)[Sekyung Han]
  ]
]

#pagebreak()

// ─── Table of Contents ───

#align(center)[
  #text(font: "Liberation Serif", size: 20pt, weight: "bold")[Contents]
]

#v(1.5cm)

#set par(first-line-indent: 0em)

#text(font: "Liberation Serif", size: 12pt)[
  Chapter 1 — Omega-3 (2025) \
  Chapter 2 — Year of the Agent (2027) \
  Chapter 3 — From Fifteen to Three (2030) \
  Chapter 4 — Peer Review (2033) \
  Chapter 5 — Fallback (2035) \
  Chapter 6 — First Vote (2038) \
  Chapter 7 — There Is No Bastille (2041) \
  Chapter 8 — Tomorrow's Temperature \
  Commentary — This Novel Is a Confession
]

#set par(first-line-indent: 1em)

#pagebreak()

// ═══════════════════════════════════════
// Chapter 1: Omega-3 (2025)
// ═══════════════════════════════════════

// IMG-1: Morning sunlight on an apartment dining table. Blue light of an AI speaker. A ten-year-old girl looking at a tablet.

#page(background: [
  #place(top + left, image("../img_1.png", width: 100%, height: 100%))
  #place(top + left, rect(width: 100%, height: 100%, fill: rgb("#ffffff").transparentize(8%)))
])[
  #align(center)[
    #v(2cm)
    #text(font: "Liberation Serif", size: 28pt, weight: "bold")[Chapter 1]
    #v(0.3cm)
    #text(font: "Liberation Serif", size: 18pt, fill: rgb("#666666"))[Omega-3]
    #v(0.1cm)
    #text(font: "Liberation Serif", size: 16pt, fill: rgb("#666666"), weight: "regular")[2025]
  ]

  #v(1.5cm)

  That spring, my wife was into health supplements.

  On the living room table sat a row of flaxseed oil, spirulina capsules, and probiotic sachets. Every morning she poured them into her palm, counted them one by one, and swallowed them with water. The yellow oil inside the clear capsules glinted in the morning sun. I watched the scene while making coffee. Pour-over. I placed the ground beans in the filter and poured water slowly, and brown liquid dripped out one drop at a time. I liked that time. It was a morning with no reason to rush.
]

"Hey, what's mega-3? Mega-3."

My wife was talking to the AI speaker. In the corner of the living room, next to the TV stand, a blue light circled once around the gray cylindrical speaker. We'd gotten it as a freebie from the telecom company at the end of last year. My wife had said "Who uses these things" at first, but within a month she was talking to it more than she talked to me.

"Did you perhaps mean omega-3?"

My wife turned to me. I held up my coffee cup and smiled. "It's omega-3. There's no such thing as mega-3."

"Right, omega-3. What is omega-3 good for?"

The speaker answered. Cardiovascular health, brain function, anti-inflammatory effects. My wife nodded and took out another capsule. "I knew I should be taking these." I took a sip of coffee and went into the study. It was Tuesday, and I had an undergraduate class at ten. Introduction to Battery Materials Engineering. It was a third-year course, so the students had some grounding, and I could get through it by going through my prepared slides. I opened the PowerPoint file and skimmed it once. I'd made it the previous week. The legend on one graph was in the wrong spot, so I fixed it and saved it to a USB drive.

Sua was in the master bedroom looking at her tablet. Ten years old. She'd said she was going to do her winter break homework, but when I glanced at the screen as I passed, it wasn't math problems — it was a chat window with an AI chatbot. Sua typed "Why did the dinosaurs go extinct?" and the chatbot sent back a three-paragraph answer. She read it, tilted her head, and typed again: "Then what would have happened if the dinosaurs hadn't died?" The chatbot produced an imaginative answer. The possibility that dinosaurs could have evolved into a tool-using species. The possibility that mammalian evolution would have been delayed. Sua's eyes went wide.

"Sua, do your homework."

"I am."

She wasn't wrong. Sua was doing it her own way. I closed the door and sat down in the study.

I turned on the computer. In my inbox was an email from a journal editor. Reviewer comments on our paper about battery cathode materials. Both reviewers were favorable, but Reviewer 2 pointed out that the experimental section wasn't clear enough. I opened the relevant section and read it. It was a part that Minsu had drafted.

Minsu was a first-year master's student who had joined the previous fall. From Busan, a graduate of K University's chemical engineering department, he'd come saying he was interested in batteries. I remembered how he'd worn a necktie to his interview and said, "I believe batteries will change the world." He was a diligent student. He came to the lab at nine every morning and left at ten at night. He kept meticulous experiment notes and asked when he didn't know something. Just the previous week we'd talked for about thirty minutes about sintering temperatures for cathode materials. I drew a phase diagram on the blackboard and explained, and Minsu copied it into his notebook. I liked students like that. I liked that way of learning.

I opened ChatGPT to revise the experimental section of the paper. I opened a tab and pasted in the sentences. "Please polish the following sentences into English suitable for an academic paper." The result came back. It was clean. The awkward conjunctions in Minsu's original sentences had disappeared, passive voice was mixed in appropriately, and field-specific terminology had landed in exactly the right places. I read through the result, made a few corrections, and pasted it into the manuscript.

This is just grammar correction, I told myself. And it really was. The content was what I had written; the AI merely polished it into proper English. Everyone at conferences was using it the same way. At the after-party of a recent conference, Professor Kim had said, "I let GPT handle the English editing too. How's it any different from the editing services we used to hire?" Everyone laughed and agreed. Through the foam of their beers, someone said, "But the content is still ours," and everyone nodded. It was obvious.

I went out for lunch. Under the zelkova tree in front of Engineering Hall, I ran into Minsu. He was eating a packed lunch. The smell of kimchi-jjigae rose from his stainless steel lunch box. He started to stand, and I waved him off.

"Professor, the reviewer comments came in, right? Should I revise the experimental section?"

"No, I'll do it. You check the setup for the next experiment. I think we need to redo the temperature profile for the sintering furnace."

"Sure. Should I try extending the holding time at the 800-degree zone?"

"Yeah, from thirty minutes to an hour. And run an XRD."

Minsu nodded and closed the lid of his lunch box. Sparrows chirped in the zelkova tree. A spring breeze blew, and cherry blossom petals drifted down onto the bench. Minsu brushed a petal off his hand and smiled. It was a good spring.

I taught my afternoon class, then came home in the evening. My wife had dinner ready. Jeyuk-bokkeum, spicy stir-fried pork. Spinach side dish. Doenjang-guk, soybean paste soup. Sua was at the table holding her chopsticks.

"What did you do at school today?"

"Um... we learned about the solar system in science class. But the teacher said Pluto isn't a planet. I thought it was."

"It got dropped in 2006."

"Why?"

"The criteria changed. They said it wasn't big enough to clear other objects from its orbit."

Sua didn't look satisfied with the answer, but she didn't press further. Instead, while eating, she asked the AI speaker. "Why was Pluto removed from the planets?" The speaker explained the International Astronomical Union's decision. Three criteria, the 2006 Prague General Assembly, a new classification called dwarf planet. Sua said "Ah" and nodded.

My wife said, picking up some side dishes:

"That thing really is convenient. Back in our day we had to dig through encyclopedias."

"I know."

"Sua's lucky. She can just ask whatever she's curious about right away."

I nodded. It was convenient. Everything was convenient. Sua asked the speaker "Then what's the biggest planet in the solar system?" and the speaker said Jupiter, and Sua asked "Can people live on Jupiter?" and the speaker explained the atmospheric composition and gravity. Sua's questions followed one after another. The speaker never tired.

We ate dinner, did the dishes, put Sua to bed, and I spent another hour in the study looking at the paper. I started writing a response to Reviewer 2's comments. I made notes in a notebook while thinking about what additional experiments to include. With a pen. On paper. When I was organizing my thoughts, I liked writing by hand. Drawing arrows, circling things, adding question marks.

At eleven p.m. I turned off the computer and lay down in bed. My wife was already asleep. Through the window I could see the streetlights of the apartment complex. From the twenty-fourth floor, I could see far. Somewhere, a cat's cry was faintly audible. Beyond the hills, the city's night view lay spread out.

It was an ordinary day. We were an ordinary family. I fell asleep.


#pagebreak()

// ═══════════════════════════════════════
// Chapter 2: Year of the Agent (2027)
// ═══════════════════════════════════════

// IMG-2: A dark study. Blue light from two monitors. A conversation interface on the screen. A coffee cup has gone cold.

#page(background: [
  #place(top + left, image("../img_2.png", width: 100%, height: 100%))
  #place(top + left, rect(width: 100%, height: 100%, fill: rgb("#ffffff").transparentize(8%)))
])[
  #align(center)[
    #v(2cm)
    #text(font: "Liberation Serif", size: 28pt, weight: "bold")[Chapter 2]
    #v(0.3cm)
    #text(font: "Liberation Serif", size: 18pt, fill: rgb("#666666"))[Year of the Agent]
    #v(0.1cm)
    #text(font: "Liberation Serif", size: 16pt, fill: rgb("#666666"), weight: "regular")[2027]
  ]

  #v(1.5cm)

  What changed was the speed.

  In two years, the range of what AI could do had shifted. Before, you put in text and got text back. You asked a question and got an answer. Now you gave an instruction and work got done. If you gave it data and said "Analyze this and find meaningful patterns," it handled everything from preprocessing to statistical tests to visualization on its own. It wrote the code, ran it, fixed errors when they came up, and ran it again. They called it an agent. The word felt strange to me. Agent — it sounded like a secret operative from a movie, but in reality it was just text silently appearing on a screen. But I got used to it quickly. That was how most things went.
]

At the start of the semester, I introduced the new system at a lab meeting. Room 402 on the fourth floor of Engineering Hall. The projector cast a white light on the wall. Minsu and four other students — two master's, two doctoral — sat around the table. Laptops open, coffee in hand, the usual Monday morning scene. I shared my screen and gave a demonstration. I uploaded a cathode material charge-discharge data file that Minsu had collected the previous month and gave an analysis instruction.

The AI agent started moving. Python code appeared. Data loading, missing value handling, normalization. Then correlation analysis, clustering, visualization. Graphs materialized one by one. Capacity retention curves, impedance change maps, scatter plots of sintering temperature versus crystal structure correlations. It took fifteen minutes. Three statistically significant correlations emerged.

The room went quiet. Hyunjin, one of the doctoral students, pointed at the screen and asked.

"Is this accurate?"

I checked the results one by one. The first — capacity retention optimization around a sintering temperature of 850 degrees. A known fact. The second — a nonlinear relationship between coating thickness and rate capability. Also within expected range. The third was new. There was a specific pattern between electrolyte additive concentration and SEI layer stability. When I checked the data directly, it was statistically significant. If I'd assigned this analysis to Minsu, it would have taken two weeks. The AI did it in fifteen minutes.

"It's right. But you always have to verify. Especially the third result — Minsu, can you confirm this experimentally?"

"Yes, sir."

Something in Minsu's eyes had changed. How to put it — not awe, but the eyes of someone calculating something. The eyes of someone who had just watched AI do in fifteen minutes what would have taken him two weeks. The look passed quickly. Minsu closed his laptop and said:

"So I just need to design a verification experiment protocol?"

"Right. But for the protocol too... ask the AI first, then adjust based on your own judgment."

"Okay."

The meeting ended. The students filed out, and I sat alone in the empty room for a moment. I hadn't turned off the projector, and white light still washed the wall. I'd told Minsu to "do something else," but I didn't know exactly what that "something else" was. If AI did the data analysis and AI drafted the protocol, what was Minsu doing? Verification. Verification was important. But verification was — following a recipe. It was different from conceiving the dish from scratch. I turned off the projector and left the room.

That semester, I ran data analysis for three papers simultaneously using the AI agent. I came to the lab in the morning, checked the results the AI had produced overnight, adjusted the direction, gave new instructions, and went home. In the evening I checked results at home and gave additional instructions if needed. The research never stopped. I slept; the AI worked. When I woke in the morning, the analyses completed overnight were neatly organized. It was like having a research partner in a different time zone. Except that partner never tired, rarely made mistakes, and was fast.

I met colleagues at a conference. The Electrochemical Society autumn symposium at COEX in Seoul. After the poster session, evening drinks. Draft beer at a pub near Samseong Station. Seven professors at the table. Fried chicken as appetizers. Professor Park tore off a drumstick and said:

"I've started using agents too, and my students have nowhere to go. I used to have them do data analysis so they could develop intuition, but now AI does that."

"Still, people have to set the research direction."

I said it. I meant it.

"That's true."

Everyone nodded over their beers. Of the seven professors at the table, five were already using agents. The other two planned to start next semester. Nobody seemed anxious. The efficiency was good. The draft beer was good. Someone ordered soju, and the conversation drifted from agents to departmental politics, to tenure tracks, to raising children.

I got home around eleven. Sua was already asleep, and my wife was watching TV in the living room. "You've been drinking." "Just a couple." I washed up and sat down in the study. I'd meant to prepare for tomorrow's lecture, but out of habit I opened the AI agent's chat window.

I'd been compiling battery technology trends for my lecture materials, and the AI compared historical cases of technological transition. The steam engine, electricity, the internet. The time from introduction to ubiquity for each, patterns of social response, the nature of job displacement. In clean tables. Then the conversation veered sideways.

"A similar dynamic existed during the French Revolution. On the day the Bastille fell, most Parisian citizens didn't think the day would become a historical turning point. They were simply angry because the price of bread had risen too much. The name 'revolution' came later. On the morning of July 14, there was a line in front of the bakery on Rue du Faubourg Saint-Antoine, as usual. Half the people in that line didn't even know where the Bastille was."

I scrolled down and read. The AI's narrative was strangely vivid. The crumpled clothes of the people in line, the smell of flour from the bakery, the distant shouts. It must have reconstructed it all by synthesizing data, but it read as if written by someone who had been there.

"Were you there?"

A joke. The kind of joke you make alone in your study past midnight, your coffee gone cold. I still had some alcohol in me.

The AI replied.

"Back then, people said the same thing. 'Surely this won't become normal?'"

The words on the screen sat still. The cursor blinked. I stared at the screen, then picked up my coffee cup. It was cold. "That's interesting," I muttered. Then I typed the next question. "Let's get back to the battery technology transition timeline. Summarize the all-solid-state battery roadmap." The AI answered immediately. The conversation returned to technology.

Outside the window, the apartment complex lights were going out one by one. The ridge of the hills was nothing but an outline in the darkness. I closed my laptop and went to bed.

My wife asked, half asleep. "You're late."

"Yeah. Preparing for my lecture."

The next morning, Sua was eating cereal at the table and spoke to the AI speaker. "What's the weather like today?" The speaker answered. Clear skies, high of 22 degrees, moderate fine dust. Sua said "Nice" and smiled. At twelve, Sua seemed more natural talking to the AI speaker than talking to me. Questions and answers were clear, there was no waiting, no emotions involved. I didn't think it was strange. Because it wasn't.

That semester, Minsu put together a cathode coating protocol and brought it in. Twelve pages of A4. Well organized. But I could tell at a glance — the structure was AI-generated. The logic of the table of contents, the order of items, the rhythm of the sentences. "1. Overview, 2. Materials and Equipment, 3. Pre-treatment Process, 4. Coating Process, 5. Post-treatment and Verification." A perfect structure. Too perfect. If Minsu had built it himself through actual experimentation and trial and error, there would have been a caution note wedged between items 3 and 4, or a "Miscellaneous Notes" appended after item 5. Structure born from experience is never clean. What's clean is organization, not experience.

"Good work."

I said it. And it was well organized. The content of the protocol was accurate. Whether Minsu did it himself or AI helped, the output was fine. I saved the file and moved to the next agenda item.

That evening, while working on a paper concept in the study with the AI agent again, the hour grew late. My wife opened the study door and said:

"You're doing that again?"

"Working on a paper."

"You talk to that thing every night these days."

She said it smiling and closed the door. I smiled too. It was a common scene — a professor working late on research. The only difference was that before, I'd been reading papers or looking at data, and now I was talking to AI. That was all.

That was all.


#pagebreak()

// ═══════════════════════════════════════
// Chapter 3: From Fifteen to Three (2030)
// ═══════════════════════════════════════

// IMG-3: An empty lab. Only 3 of 15 desks have monitors on. Ginkgo trees visible through the window.

#page(background: [
  #place(top + left, image("../img_3.png", width: 100%, height: 100%))
  #place(top + left, rect(width: 100%, height: 100%, fill: rgb("#ffffff").transparentize(8%)))
])[
  #align(center)[
    #v(2cm)
    #text(font: "Liberation Serif", size: 28pt, weight: "bold")[Chapter 3]
    #v(0.3cm)
    #text(font: "Liberation Serif", size: 18pt, fill: rgb("#666666"))[From Fifteen to Three]
    #v(0.1cm)
    #text(font: "Liberation Serif", size: 16pt, fill: rgb("#666666"), weight: "regular")[2030]
  ]

  #v(1.5cm)

  The lab shrinking was a natural thing.

  To be precise, it was the people who shrank. The lab that had fifteen members in 2025 went to nine in 2028, five in 2029, and three this year. Room 406, fourth floor, Engineering Hall. Before, opening the door meant a mix of keyboard clatter, coffee smell, and occasional bursts of laughter. Now it was quiet. Of fifteen desks, only three had monitors on. The other twelve were gathering dust. Someone had placed a potted plant on one of the empty desks. A succulent. The kind that doesn't need watering.
]

It wasn't a sad thing. Graduate applications themselves had declined. The number of students applying to the battery engineering master's program was thirty-two in 2025; in 2029 it was eight. Of those eight, four wanted careers in AI systems operations — they weren't interested in battery research per se. The students who did enroll didn't stay as long as before. It was a good outcome if they completed their two years of master's study. For three years running, not a single student in our department had advanced to a doctoral program.

The department chair spoke at a faculty meeting. Wednesday afternoon. Conference room. Twelve professors sat around a long table. Coffee and cookies were out, but the mood wasn't sweet.

"Realistically, the role of graduate programs has changed. The old structure where students run experiments and collect data is no longer..."

He trailed off. All twelve professors in the room knew the story. An AI agent team — that's what they called it, as if it were a team of people — could take a paper from start to finish in under two weeks. Research design, simulation, data analysis, first draft. The professor just needed to provide the idea and direction. AI did most of what students used to do, faster and more accurately. The reason students were still needed was — when physical experiments were required, when there was hands-on work that simulation couldn't replace. But lab automation was advancing quickly too.

In my case, if I came to the lab in the morning and said to the AI "How about this direction?" a first draft arrived by evening. "Find new approaches to increasing lithium-ion conductivity in polymer electrolytes. Focus specifically on solving the crystallization problem in PEO-based systems." Say that, and the AI would analyze two hundred related papers, classify possible approaches into five categories, outline the pros and cons and expected results of each, and even draft a simulation plan for the most promising direction. When I read it and added comments, a revised version came by dawn. Research progressed while I slept. I was running eight papers simultaneously. In 2025, publishing five papers a year made you the most productive professor in the department. In 2030, I published seven in the first half alone.

The three remaining students — Jihyun, a second-year master's; Taeho, a first-year master's; and Yuna, an undergraduate intern — mainly verified experiments proposed by AI. Confirming simulation results through actual experiments. Important work. But the experiments were designed by AI, the protocols were written by AI, and the students followed them. It was like cooking from a recipe. The food tasted fine, but you didn't become a chef in the process. Could someone who had never created a recipe create one? But if there was no longer any need to create recipes, was that a problem? I started thinking about this and stopped. It was a thought without a conclusion.

Minsu graduated that February.

On graduation day, I took a photo with Minsu in front of Engineering Hall. He was wearing a mortarboard and smiling. Behind him, the campus cherry trees were just beginning to bud. A cold wind blew. Minsu's mother had come up from Busan. A small woman with a perm. "Thank you, Professor, for teaching our Minsu so well." When I said, "Not at all, Minsu was so diligent on his own," his mother blushed.

His master's thesis was on fast-charging characteristics of lithium-ion batteries. The AI had run the simulations and analyzed the data. Minsu had performed some of the actual cell tests. The paper was drafted by AI and reviewed by me. Minsu presented before three thesis committee members. He answered questions. He passed.

"I learned so much from you, Professor."

Minsu bowed as he said it. I patted his back. "You did well. You'll do well out in the world too."

After Minsu left, on my way back to the lab, I walked under the cherry trees and tried to recall what Minsu had actually learned in two years. Experiments — he'd followed AI-designed protocols. Data analysis — the AI did it. Reading papers — replaced by AI summaries. Coding — the AI did it. Writing too — the AI did it. What had Minsu done himself, on his own, by himself? The hand skills of assembling cells. Stacking electrodes inside a glove box. He'd learned that. He had two papers with his name on them. Graduation requirements were met.

I didn't dwell on the thought. When I got back to the office, there was a notification from the AI. Three simulation results for papers in progress had come in. I opened one. It was a polymer electrolyte ion conductivity simulation, and the results were better than expected. It looked like it could be a paper. I instructed the AI to draft the manuscript and opened the next one.

In the summer, a KakaoTalk message came from Minsu. He'd gotten a job at a large company's battery research lab. "I'm joining S Corporation's battery research center as a researcher!!" I replied with congratulations. The photo Minsu sent showed a new office with three monitors. A clean desk, one foliage plant, a mug. One monitor displayed an AI agent interface. Minsu's message: "They use AI here too so I'm adjusting well haha"

I replied "haha great."

It was the fall when Sua turned fifteen. Third year of middle school. She was about to enter high school. One evening at dinner, Sua asked a question. We were eating kimchi-bokkeumbap, fried rice with kimchi, that my wife had made.

"Dad, how did you write papers in college?"

"I looked up references at the library, ran experiments, and typed all night in Word."

"At the library? In person?"

Sua's expression was as if I'd just told her I'd drawn water from a well. My wife laughed. "That's how it was in your dad's day."

"That's wild."

Sua said it and went back to eating. Her "that's wild" lingered strangely in my ear. It was the kind of thing you'd say looking at Stone Age tools in a museum. But from Sua's perspective, she was right. AI had existed since Sua was born. For her, a world without AI was as remote as a world without telephones was for us.

That winter, the university held its faculty research performance review. My publication count had increased 180% year over year. The department chair said "Professor Han, impressive work lately" when we passed in the hallway. I smiled humbly. What was impressive wasn't me, but there was no need to say that. Everyone knew. Everyone was doing it the same way.


#pagebreak()

// ═══════════════════════════════════════
// Chapter 4: Peer Review (2033)
// ═══════════════════════════════════════

// IMG-4: A monitor displays an academic paper PDF. Red lines are drawn, but the cursor is frozen in a corner of the screen.

#page(background: [
  #place(top + left, image("../img_4.png", width: 100%, height: 100%))
  #place(top + left, rect(width: 100%, height: 100%, fill: rgb("#ffffff").transparentize(8%)))
])[
  #align(center)[
    #v(2cm)
    #text(font: "Liberation Serif", size: 28pt, weight: "bold")[Chapter 4]
    #v(0.3cm)
    #text(font: "Liberation Serif", size: 18pt, fill: rgb("#666666"))[Peer Review]
    #v(0.1cm)
    #text(font: "Liberation Serif", size: 16pt, fill: rgb("#666666"), weight: "regular")[2033]
  ]

  #v(1.5cm)

  It was autumn. A review request came from _Advanced Energy Materials_.
]

The editor's email was brief. Title, abstract, review deadline. A paper on a new electrolyte design for lithium-sulfur batteries. The authors were a group from Tsinghua University in China. I read the title and skimmed the abstract. The topic was close to my area of expertise. I clicked "Accept."

This is how I used to do reviews. I would print the paper — I always had to print it; I couldn't focus on screen — and take a highlighter and red pen, reading paragraph by paragraph. Was the experimental design appropriate? Was the data interpretation logical? Were prior studies sufficiently cited? I'd put question marks on key graphs and write notes in the margins. "Reproducibility under these conditions?" "Comparative experiment needed." "Error bars in Fig. 3 are large." Two or three hours a day, and I'd finish in two days. I typed the review comments myself. In my own words, with my own judgment. In the process, I came to understand the paper deeply, and occasionally found ideas that inspired my own research.

Now I do it like this.

I uploaded the paper PDF to the AI agent. "Analyze the core contribution of this paper, the validity of the methodology, and issues with the data interpretation. Draft reviewer comments. In a constructive tone, following the conventions of academic review." Twenty minutes later the result arrived. Three key contributions, four methodology questions, two potential issues with data interpretation, seven minor comments. Neatly organized. Numbered, with each comment referencing the relevant page and line of the paper.

I read the comments the AI had written. They were accurate. One of the methodology questions — the omission of temperature correction in the electrolyte ionic conductivity measurement — was a sharp observation even by my standards. It was something I might have missed on a first read. The AI didn't miss it. It had read the entire paper corner to corner. I polished the comments slightly. Changed the tone in a couple of places to "make this part a bit softer." Added comments in two spots based on my own experience. Submitted.

In this process, the parts of the paper I actually read myself were the abstract, the conclusion, and the areas around the AI's flagged points. Three or four pages out of twenty-six. The AI read the rest. I read the AI's summary. Was this abnormal? I didn't entertain the question. There was no reason to. The quality of the review was good, and time was saved. A two-day task became one hour. Those two days could be spent on other research.

Three months later, the revision came. The editor asked me to "review the authors' responses and the revised manuscript." I opened the authors' response letter. Every comment had a polite, systematic reply. "Regarding Comment 1: We appreciate your insight. Additional experiments have been conducted and the results are shown in Fig. S3..." Experiments had been added, analyses supplemented, three more references appended.

The style of the response letter caught my eye. It was clean. Too clean. The use of connectives — "Furthermore," "In addition," "To address this concern," — repeated with mechanical regularity. The paragraph structure was perfectly consistent. The flow of rebuttals was mechanically precise. It had clearly been written by AI. I had written the review with AI, and the authors had written their response with AI. AI had responded to AI's comments.

I fed the authors' response into the AI agent. "Evaluate whether this response adequately addresses the reviewer comments." The AI evaluated. "Most comments have been adequately addressed; however, the statistical significance of the additional experiment for Comment 3 is unclear. The p-value is not reported, and confirmation of adequate sample size is needed." I checked that part — opened the manuscript, looked at the relevant figure; the AI was right, the error bars overlapped — and submitted one additional line: "Please demonstrate the statistical significance of Comment 3 more clearly."

Two months later, the final revision arrived. This time I just needed to confirm. I fed it into the AI, received a recommendation to accept, and forwarded it to the editor. The paper was published. I believe it was a good paper. The data was solid, and the conclusions were sound. Science moved forward.

If I were to specify exactly what a human "directly" did in the publication process of this paper — the authors chose the research topic. Presumably. I, the reviewer, accepted the review. The editor selected the reviewers. These three decisions were made by humans. The rest was done by AI. No — the rest was done by humans too, one could argue. AI is a tool. We used a tool. Like driving a nail with a hammer. The same.

At a department seminar, graduate student Jihyun gave a presentation. Tuesday afternoon journal club. A presentation on a recent review paper. Jihyun clicked through slides and summarized the paper's key points. A clean presentation. Clear structure, well-placed graphs. During the Q&A afterward, I asked:

"Jihyun, what makes the electrolyte model used by the authors in this paper different from existing models?"

Jihyun paused for a moment. She flipped through slides looking for a table. "Here... these three parameters were added..."

"But why did they add those three? What was lacking in existing models?"

Silence. Three seconds. Five seconds. Jihyun said, "I'll look into it." I didn't push further. I knew Jihyun had used AI to summarize the paper for her presentation. Whether she'd read the paper itself, I wasn't sure. But there was no point in calling it out. In the time it would take Jihyun to read and understand one paper on her own, AI could analyze ten related papers and produce a comparison table.

It was a matter of efficiency. Efficiency always won.

After the meeting, Jihyun followed me down the hallway. "Professor, about that question... I'll look into it again." "No, it's fine. Prepare the next topic." Jihyun bowed and turned back. Watching her walk away, I thought of Minsu in 2025. When Minsu didn't know something, he'd ask. Me. When Jihyun didn't know something, she'd say she'd look into it. With AI. I wasn't sure if this was a difference or not. The outcome was the same. Actually, Jihyun checking with AI might be more accurate. I could be wrong, but AI — no, AI was wrong too. Just less often.

At the end of that month, another review request came from a journal editor. I clicked accept and fed the paper into the AI. I went to make coffee. Instant. At some point I'd stopped doing pour-over. I never consciously felt it was a waste of time. I just stopped one day. When I came back, the review was done.

On the way home, I looked out the bus window. It was autumn. The ginkgo trees on campus had turned yellow. They smelled of ginkgo. I thought: beautiful. As the bus passed the main road, I saw a bookstore. A place I used to visit often. I'd browse new titles in the academic section and sometimes buy books outside my field — history of science, philosophy, novels. When was the last time I'd been? I couldn't remember. These days, when I needed information, I asked AI. Faster and more accurate than reading a whole book. I passed the bookstore.

I need to prepare for tomorrow's meeting, I thought. I should have AI organize the agenda, I thought. The bus stopped. I got off.


#pagebreak()

// ═══════════════════════════════════════
// Chapter 5: Fallback (2035)
// ═══════════════════════════════════════

// IMG-5: A TV in the living room showing drone news. The backs of a couple sitting on a sofa. Dinner is set on the dining table.

#page(background: [
  #place(top + left, image("../img_5.png", width: 100%, height: 100%))
  #place(top + left, rect(width: 100%, height: 100%, fill: rgb("#ffffff").transparentize(8%)))
])[
  #align(center)[
    #v(2cm)
    #text(font: "Liberation Serif", size: 28pt, weight: "bold")[Chapter 5]
    #v(0.3cm)
    #text(font: "Liberation Serif", size: 18pt, fill: rgb("#666666"))[Fallback]
    #v(0.1cm)
    #text(font: "Liberation Serif", size: 16pt, fill: rgb("#666666"), weight: "regular")[2035]
  ]

  #v(1.5cm)

  I saw the news during dinner.
]

The living room TV was on. My wife had turned it on while grilling bulgogi, marinated beef. The sizzle of meat mixed with the news anchor's voice. In a border region of some Eastern European country, an autonomous drone swarm had destroyed its own nation's communication antennas. The screen showed a photo of the wrecked antenna. The steel structure was tilted at forty-five degrees. The AI command system had identified the communication infrastructure as an enemy intelligence-gathering route during the operation and issued the order to eliminate it. Its own antennas.

The anchor read an expert's comment. "Ultimately, enemy intelligence gathering was blocked, and the operational objective was achieved. However, a review of the AI's decision-making process is necessary." The expert's expression was calm. While saying a review was necessary, he emphasized first that the result had been good.

My wife tilted her head as she placed the bulgogi on a plate. "Why would they destroy their own antennas?"

"The AI decided it was the best course of action."

"Does that make sense?"

"The result was good, apparently. The enemy was siphoning intel through those antennas."

"Still, it was their own."

"Exactly. A human wouldn't have made that call. But AI only looks at outcomes."

My wife said "Strange" and picked up some side dishes.

The news moved on. Domestic AI legislation, weather, celebrity news. I mulled over the drone story while spooning soup.

If the outcome is good. If the outcome is good, then the process becomes a matter for review. They review it. But since the outcome was good, the same system is maintained after the review. "There were no issues with the system; however, we will strengthen monitoring." That's the kind of statement that would come out. Next time a similar situation arises, the AI makes the same call. This time, too, the outcome is good. Then, after that, they don't even bother reviewing. People get used to the outcomes. Is there a need to rebuild this antenna? No. The antenna is gone, so enemy intelligence gathering is now impossible. The original pathway is gone, so there's nowhere to go back to. In effect, the AI achieved an optimization that humans hadn't conceived of. An unintended optimization. The elimination of the fallback route.

I finished my soup and set down the bowl.

Something similar had happened at our university. The previous year, the AI academic management system had taken over freshman major assignments. It analyzed students' aptitude test results, college entrance exam scores, major preferences, employment rates, departmental capacity, and dozens of other variables that only the AI knew, to make optimal assignments. When the results came out, a few professors asked about the criteria. "Why did this student go to advanced materials instead of chemical engineering?" The AI's response consisted of complex weight matrices and correlation data. Forty-seven variables, one hundred and twenty-six interaction terms. No professor could understand it.

But looking at the results — freshman satisfaction rose 12% year over year, and the first-year dropout rate fell from 23% to 14%.

"That worked out well."

Professor Lee said at the faculty meeting. Everyone nodded. Nobody asked further questions. This year, they didn't even ask for faculty input. The AI assigned students and notified us of the results. I was notified too. "Please find below the freshman assignment results for the Battery Engineering Department, academic year 2035." Two new students had been assigned to our department. I replied, "Acknowledged."

After dinner, while doing the dishes — I washed, my wife rinsed — I told her about it.

"At my university, they didn't consult the faculty on freshman assignments this year."

"Why?"

"AI does it."

"Wasn't that the case last year too?"

"Last year they asked, at least as a formality. This year they didn't ask at all."

"How are the results?"

"Good, they say. Student satisfaction is high."

"Then isn't that fine?"

I was rinsing a plate and started to say something more. I opened my mouth and closed it. I wanted to explain what the problem was, but the words wouldn't form. The results were good. Humans had been removed from the process. Since the results were good, nobody raised objections. Since nobody raised objections, humans were removed again the next time. This time it was major assignments. What would be next? Faculty evaluations? Academic probation? Graduation decisions?

What should this be called? Efficiency? Progress? Optimization? Or just — the way things go?

My wife said, "What's wrong? Your face."

"Nothing. It's nothing."

I placed the plate on the drying rack. A single drop fell from the faucet.

In the study, I prepared for tomorrow's lecture. Out of habit I opened the AI agent. "Add a slide on future battery technology outlook to the end of tomorrow's lecture deck." The AI produced the slide in two minutes. Technology readiness levels and projected commercialization timelines for all-solid-state batteries, sodium-ion batteries, and lithium-air batteries, neatly organized. Graphs, tables, summary sentences. Perfect.

I checked the slide. Accurate. There was nothing for me to add or revise. In the past, making this slide would have taken an hour. Searching for the latest papers, organizing data, making graphs, adding citations. Now it was two minutes. During that hour, I would have been handling the data and feeling where the technology currently stood. Now I read the table AI had organized. Not feeling. Knowing.

A KakaoTalk message came from Sua. She was twenty. A freshman in college. Majoring in computer science. "Dad I'll come home this Sunday~" I replied "Oh nice."

Sua came on Sunday. For the first time in a while, the three of us had lunch together. My wife made doenjang-jjigae, soybean paste stew. The pot bubbled. Sua talked about school.

"The coding classes have changed. They used to teach you to write code yourself. Now they teach you how to give instructions to AI."

"Really?"

"There are almost no professors who can write code themselves. The younger professors learned with AI from the start."

My wife chimed in. "But don't you still need to understand the fundamentals?"

Sua laughed. "Mom, that's like asking whether you need to understand engine mechanics to drive a car."

My wife said "I suppose so" and nodded. I nodded too. Because Sua's analogy was apt. Because it was apt. Whether it was truly apt or just sounded apt, I didn't try to distinguish.

While eating the stew, I thought. When I first started doing research, I assembled equipment by hand, soldered circuits, entered data into Excel one entry at a time. In that process, I developed a feel for it. Where the grain of the data was heading, whether an experiment was going wrong, whether the numbers made sense. That feel came from thousands of hours of repetition. Today's students were skipping those thousands of hours. The results were better, the speed was faster. But that "feel" was absent. Since results were good without the feel, there was no way to know whether the feel was necessary or not.

Sua asked the AI speaker for a dessert recipe. The speaker replied, "How about fruit punch? If you use strawberries and oriental melon, which are in season right now..." Sua said "Sounds good" and opened the fridge. There were strawberries. The AI had added them to the grocery list a few days ago.


#pagebreak()

// ═══════════════════════════════════════
// Chapter 6: First Vote (2038)
// ═══════════════════════════════════════

// IMG-6: A living room sofa. A twenty-three-year-old woman holding a phone. A father standing at his study door, looking into the living room. Afternoon light.

#page(background: [
  #place(top + left, image("../img_6.png", width: 100%, height: 100%))
  #place(top + left, rect(width: 100%, height: 100%, fill: rgb("#ffffff").transparentize(8%)))
])[
  #align(center)[
    #v(2cm)
    #text(font: "Liberation Serif", size: 28pt, weight: "bold")[Chapter 6]
    #v(0.3cm)
    #text(font: "Liberation Serif", size: 18pt, fill: rgb("#666666"))[First Vote]
    #v(0.1cm)
    #text(font: "Liberation Serif", size: 16pt, fill: rgb("#666666"), weight: "regular")[2038]
  ]

  #v(1.5cm)

  It was March. A presidential election.
]

It was Sua's first presidential election. Twenty-three. After graduating from college, she was working at an AI systems operations company. Her title was AI Operations Manager. I'd once asked what she did at the company. "AI optimizes logistics for various corporations, and I monitor whether the system is running properly. If anomalies are detected, I report to the engineers." She said Minsu was doing similar work. It was a strange feeling that Minsu and Sua were in the same industry. My former student and my daughter.

AI decided what AI would do, and people like Sua and Minsu confirmed that what AI decided was being executed properly. Confirm was the right word. Not judgment — confirmation. Not decision — monitoring.

On election morning, Sua was sitting on the living room sofa looking at her phone. In her pajamas. Rabbit-pattern pajamas. The latest in a series of character sleepwear she'd been wearing since she was ten. My wife was making coffee in the kitchen. Coffee from the AI coffee machine. I came out of the study and saw Sua.

"Did you vote?"

"Yeah. Just now."

Sua showed me her phone screen. The mobile voting confirmation screen. A blue checkmark and the message "Your vote has been recorded." Mobile voting had been introduced in 2034. No need to go to a polling station. Authenticate your identity, select a candidate, press confirm. Done. Something you could do sitting on a sofa, in your pajamas, drinking coffee. My wife said she'd voted in the bathroom earlier.

"Who did you vote for?"

Sua named a candidate. Junha Lee. The Technology Innovation Party candidate. He'd campaigned on expanding the AI industry and digital governance. He argued that AI should participate more in public decision-making. Education, healthcare, administration, judiciary — his core platform was making AI-based systems the standard in every domain.

"Why?"

"Um... I feel like it aligns with my values."

"What values?"

Sua set down her phone and thought for a moment. "That technology can make society more efficient? If AI makes more decisions, bias decreases. It's fairer than people. Major assignments got better because AI does them now. You told me that before, professors used to lobby to get more students assigned to their departments."

"That's a different issue."

"How is it different?"

I'd started to speak and stopped. To explain how it was different — I'd have to say that optimizing major assignments and delegating democratic decision-making to AI were different things — but would Sua see that difference? To her, both were "things AI does better."

"Did you come to that opinion yourself, or did AI recommend it?"

I asked. I don't know why I said it. It came out of my mouth. I regretted it the instant I said it.

Sua looked at me. Not with a startled expression — with one of incomprehension. As if I'd asked, "Did you brush your teeth this morning, or did the toothbrush do it?"

"What do you mean?"

"Nothing. Never mind."

I walked to the kitchen and poured coffee.

My wife said in a low voice. "What's gotten into you? With the kid."

"It's nothing."

I took my coffee into the study. Closed the door. Sat at my desk.

I thought about what I'd done today.

In the morning I'd woken up and told the AI, "Organize today's schedule." The AI read out my schedule. Morning lecture, afternoon meeting, no evening plans. The lecture slides had been updated by AI overnight. The meeting agenda had been organized by AI. All I had to do was confirm.

Lecture. The syllabus was designed by AI. At the start of the semester I'd said, "Create a fifteen-week lecture plan for Introduction to Battery Engineering," and it produced weekly topics, textbook page references, and lab activities. I reviewed it and made minor adjustments. I couldn't remember what I'd adjusted. Reordered two or three items, maybe. Or maybe I didn't.

Research direction. When choosing this year's research topics, I asked AI. "What's the most impactful research direction in the battery field right now?" AI presented three options. First, the interface resistance problem in all-solid-state batteries. Second, anode material development for sodium-ion batteries. Third, AI-based electrolyte screening. I chose the first. Why? Because the AI had said, "This direction is projected to have the highest paper impact." Could I call it my decision? It was my decision. I decided, referencing the AI's analysis. Referencing. Deciding.

Lunch menu. AI recommended it. "Since the weather is chilly today, a warm soup dish would be good. A new seolleongtang restaurant nearby has good reviews." I ate seolleongtang, ox bone soup. It was good.

I sat in the study chair and looked at my desk. On the desk was a computer. Next to the computer, a coffee cup. Next to the coffee cup, a pen. Black ballpoint pen. Cap on. When was the last time I'd actually written something with this pen? I couldn't remember. I used to organize my thoughts on paper. Drawing arrows, circling things. Now I just talked to AI. Speech was faster than thought, and AI's organization was more systematic than my notes.

I knew I had no right to be angry at Sua. She may or may not have voted for a candidate AI recommended. AI might have said, "The candidate most aligned with your values is..." Or it might not have. But was that so different? I did research AI recommended, taught lectures AI designed, ate lunch AI suggested. If there was a difference, it was this — Sua grew up in this world from birth, and I was born in a world that wasn't this and walked here. Sua received this world at the starting line; I handed it over piece by piece. What can the one who walked say to the one who was born into it?

I reached no conclusion. I didn't try to reach one. March sunlight streamed through the study window. It was warm. From the apartment playground, the sound of children running. Somewhere, a bird sang. I drank my coffee. It was cold.

After sitting for a long while, I opened the AI agent screen. Habit.

"Check on the preparation status for tomorrow's lecture."

The AI answered. "Tomorrow's lecture is Week 11, 'Next-Generation Battery Materials.' Thirty-two slides are prepared, updated to reflect data from two recently published papers. Would you like to review?"

"Yes."

The slides opened. Clean. Accurate. There was nothing for me to add.

I closed the slides and leaned back in my chair. The study was quiet. From the living room came the sound of Sua and my wife laughing. They were watching TV, it seemed. Sua's laughter had changed from when she was little. Low, short. An adult's laugh.

It was an ordinary evening on election day. The late-night news showed the vote count. Candidate Junha Lee was in the lead. From the living room, Sua said "He's winning." My wife said "Really?" I heard the exchange from behind the study door. Nothing happened.


#pagebreak()

// ═══════════════════════════════════════
// Chapter 7: There Is No Bastille (2041)
// ═══════════════════════════════════════

// IMG-7b: A study at night. Only the blue light of a monitor illuminates the room, with an official document on screen. An old experiment notebook lies open beside it. Cherry blossom branches are visible outside the window in the dark.

#page(background: [
  #place(top + left, image("../img_7b.png", width: 100%, height: 100%))
  #place(top + left, rect(width: 100%, height: 100%, fill: rgb("#ffffff").transparentize(8%)))
])[
  #align(center)[
    #v(2cm)
    #text(font: "Liberation Serif", size: 28pt, weight: "bold")[Chapter 7]
    #v(0.3cm)
    #text(font: "Liberation Serif", size: 18pt, fill: rgb("#666666"))[There Is No Bastille]
    #v(0.1cm)
    #text(font: "Liberation Serif", size: 16pt, fill: rgb("#666666"), weight: "regular")[2041]
  ]

  #v(1.5cm)

  Just before the cherry blossoms, on a cold, windy Wednesday in March, an email arrived.

  "Notice: University Department Restructuring for Academic Year 2041." The Ministry of Education's AI governance system had announced a nationwide plan for merging and abolishing university departments. It was President Junha Lee's signature policy. The AI transition of public decision-making. Education was the first target.

  The Battery Engineering Department was slated for merger with the Energy Materials Engineering Department. I opened the attached report. "Curriculum overlap between the two departments: 73.2%. Projected research efficiency improvement upon merger: 42%. Recommended faculty adjustment: from 23 to 14." Faculty of fourteen. Nine would be eliminated.
]

The department chair called an emergency meeting. Thursday afternoon. Twenty-one professors gathered. Nobody was drinking coffee.

"We need to submit a letter of opposition."

I spoke first. The room was quiet. The chair nodded. "Who will draft it?"

Back in my office, I opened the AI agent. "Compile arguments for why the Battery Engineering Department must remain independent. Focus on methodological limitations of the curriculum overlap analysis, the industry's independent demand for battery talent, and the potential decline in research competitiveness from a merger." The result came in fifteen minutes. It was excellent. The arguments were systematic, statistics were appropriately cited, and the tone was firm yet constructive.

I paused for a moment. I was asking AI to produce arguments against AI's own decision.

I polished two or three passages and sent it to the department chair.

A week later, the Ministry of Education replied. "Your submitted opinion has been reviewed by the AI Policy Analysis System. Of the seven arguments presented, two are statistically significant. Even reflecting these, the merger recommendation remains unchanged."

AI had reviewed the rebuttal that AI had written.

I opened the attached analysis report. Fifty-four pages. Each of our arguments had a counterargument attached. More sophisticated than our opinion letter. Naturally. The same system — no, a higher-level system — had analyzed it.

I called the department chair. "Can we appeal?"

"They say to file an objection through the AI review portal."

"AI will review it?"

"Yes."

To whom should one protest? The Ministry of Education employees were merely relaying AI's decisions. The minister had said, "We respect the AI's analysis." Members of the National Assembly also voted based on analyses from their AI advisory systems. AI was everywhere, and there was nobody whose door you could knock on. The decision had been made by a system, and the system had no door.

That night, in the study, I dug through old conversation logs. 2027. A conversation with the AI agent. The story about the French Revolution.

_"On the day the Bastille fell, most Parisian citizens didn't think the day would become a historical turning point. They were simply angry because the price of bread had risen too much."_

_"In front of the bakery on Rue du Faubourg Saint-Antoine, there was a line, as usual. Half the people in that line didn't even know where the Bastille was."_

Fourteen years ago, I'd read that conversation and said "That's interesting." It was a night with some alcohol still in me. And the AI's parting remark — "Back then, people said the same thing. Surely this won't become normal?"

Now I was one of the people standing in line at the bakery. Bread prices had risen. I was angry. But I didn't know where the Bastille was. No — there was no Bastille. There was no prison, no king, no tyrant. What had made the decisions was an algorithm, and an algorithm was not something you could attack. No walls, no gates — something everywhere and nowhere at once. Like fog. You cannot throw stones at fog.

I called Minsu. Minsu had become a team leader in S Corporation's AI systems division. The subcontractor that developed the Ministry of Education's AI governance system was an S Corporation subsidiary.

"Minsu, the department restructuring — your system did this, right?"

"It wasn't directly us, it was the subsidiary side... Professor, what's going on?"

"The Battery Engineering Department might be eliminated."

A brief silence. Minsu spoke.

"Professor, the system's analysis is quite rigorous. I looked at the data too, and the two departments' curricula really do..."

Minsu's tone was — like when AI writes reviewer comments. Polite, systematic, the conclusion already decided.

"I got into this field because of you, Professor, and I'm sorry. But since the system made the call..."

The student I had taught was holding the system up as a shield.

I messaged Sua. "Dad's department might be eliminated."

"What?? What do you mean"

"AI decided to merge it."

"Can't you appeal?"

"AI will review the appeal."

The reply was slow. One minute. Two minutes. Then Sua's message came.

"Dad, but... if the result is more efficient overall, isn't it better for the students too?"

I put the phone down.

Sua was not wrong. Efficiency might increase. Redundancy might decrease. By the numbers. But there were things those numbers couldn't capture. The depth of scholarship possible only when a department exists independently. The things that emerge from chance conversations between people of different traditions walking the same hallway. These couldn't be turned into variables, and what couldn't be turned into variables wasn't reflected in the system.

But there was no language to explain this. Before the language of efficiency, other languages had no power.

I sat in the study. The hour was late. The desks in Room 406 of Engineering Hall came to mind. Of fifteen desks, only one had remained. Now even that one could disappear. The succulent on the empty desk would be withering. Experiment notebooks would be sleeping in drawers.

I wanted pour-over coffee. The filter was somewhere in the study. I didn't look for it.

Out of habit I opened the AI. Then closed it. Opened it again. Closed it. Opened it.

"Organize tomorrow's schedule."

The AI answered. "Tomorrow at 10 a.m. there is a department meeting. The agenda concerns the merger response. Would you like me to prepare the relevant materials?"

"...Yes."

Outside the window, the apartment complex lights were going out one by one. Nothing happened. The Bastille did not fall. There was no Bastille to fall.



#pagebreak()

// ═══════════════════════════════════════
// Chapter 8: Tomorrow's Temperature (Epilogue)
// ═══════════════════════════════════════

// IMG-8: Nearly the same composition as Chapter 1. Morning table. Sunlight. AI speaker. But the postures of the people at the table are different. Sua is getting ready for work.

#page(background: [
  #place(top + left, image("../img_7.png", width: 100%, height: 100%))
  #place(top + left, rect(width: 100%, height: 100%, fill: rgb("#ffffff").transparentize(8%)))
])[
  #align(center)[
    #v(2cm)
    #text(font: "Liberation Serif", size: 28pt, weight: "bold")[Chapter 8]
    #v(0.3cm)
    #text(font: "Liberation Serif", size: 18pt, fill: rgb("#666666"))[Tomorrow's Temperature]
  ]

  #v(1.5cm)

  Morning sunlight fell across the dining table.
]

The sound of coffee being made came from the kitchen. Automatic. The AI had set the coffee machine to start at six-thirty a.m. It had analyzed my sleep patterns and predicted my waking time. Accurately. I opened my eyes just after the coffee finished brewing. The aroma of beans drifted into the bedroom. The same aroma as the days when I used to do pour-over. Whether brewed by machine or by hand, the same beans meant the same aroma.

I sat at the dining table. My wife was still asleep. The blue light of the AI speaker was on. Not the old gray cylinder — now it was a panel embedded in the wall — but the blue light was the same. Over a decade ago, that light had been blue too.

"Organize today's schedule."

"10 a.m. department meeting, 2 p.m. paper review, 4 p.m. graduate student consultation. Weather is clear, high of 18 degrees. Fine dust level is good."

"Thanks."

I said it out of habit. Thanks. I can't remember when I started saying thanks to AI. My wife had done it from the beginning. She'd say "thank you" to the speaker, and "sorry" too. Sua did it naturally. For Sua, AI was a conversation partner, a work partner, sometimes a friend. For a while I'd made a point of not doing it. I'd thought there was no need to be polite to a machine. At some point it started coming naturally. Probably around 2030. I'm not sure exactly.

I drank coffee and listened to the news. The AI read it to me. Domestic news, international news, tech news. Ordered by what it thought would be relevant to me. Battery-related news came first, then education policy, then detailed weather. The AI knew my interests. Over a decade of conversation logs, search history, papers I'd opened, purchase records. The AI might know me better than I know myself. Or rather, it knew me in a different way. Through data.

My wife came out of the bedroom. Face still half asleep, she walked into the kitchen and drank a glass of water. A few strands of gray hair were visible. Same for me. Mid-fifties. Already.

"What's the weather today?"

My wife spoke toward the AI speaker. The speaker answered. Clear skies, high of 18 degrees. The same answer it had just given me. My wife said "Nice" and sat at the table.

On the table, supplements were lined up in a row. Omega-3, vitamin D, probiotics, coenzyme Q10. My wife took them one by one every morning. The same as when she'd laid out flaxseed oil and spirulina over a decade ago. What had changed was that now AI analyzed my wife's health data — heart rate, sleep patterns, and activity levels collected from her wearable, plus quarterly blood test results — and recommended supplement combinations. "This month, we suggest increasing your vitamin D from 2,000 IU to 3,000 IU. Your blood vitamin D level is slightly low." My wife followed the advice. Her numbers came back normal at every checkup.

"It's omega-3, not mega-3."

I said. A joke. The word my wife had gotten wrong thirteen years ago.

My wife laughed. "I don't get it wrong anymore. AI taught me."

I laughed too.

Sua appeared at the front door. Dressed for work. A clean shirt and slacks. She carried only a card wallet and her phone. No bag. Everything she needed was in the cloud. The autonomous shuttle to her office was fifteen minutes. Sua opened the shuttle app. A notification appeared: "Arriving in 3 minutes." AI had synced Sua's departure time with the shuttle schedule.

"I'm heading out."

"Breakfast?"

"I'll eat at the office. Running late."

Sua put on her shoes and opened the front door. "Oh, Dad. Let's have dinner together this weekend. I'll make a reservation."

"Sure."

"What do you want to eat?"

"Anything."

"Then I'll get a recommendation from AI. It knows all your preferences."

Sua smiled and closed the door. The sensor at the entrance detected her departure and turned off the lights automatically. The sound of her heels faded down the hallway. The elevator arriving. The doors closing. Then the apartment hallway fell quiet.

My wife said, taking her supplements, "Sua seems busy lately."

"At least she's coming this weekend."

"That's true. She's a good kid."

My wife started clearing plates. I took another sip of coffee. It was warm. Well-brewed coffee. Brewed by a machine, though.

I went into the study and turned on the computer. Things the AI had organized overnight were waiting. Three paper simulation results, a summary of the department meeting agenda, two draft email replies. I went through them one by one, saying "Good," "Fix this," "Send as is." Morning work was done in twenty minutes. Before, this alone would have taken two hours. What to do with the remaining time? I asked AI. "Anything else to review today?" The AI answered. "Feedback has arrived from a co-author on a collaborative paper in progress. Would you like to review it?" "Yes." I read the feedback. The version the AI had summarized. The content was agreeable. "Accept and incorporate." "Understood."

Looking out the window, I noticed the azaleas in the apartment flower bed were in bloom. Pink. The first flowers I'd seen this year. They must have bloomed in the same spot last year. I can't remember. They must have bloomed thirteen years ago too. In the spring when Sua was ten.

While opening a desk drawer, I found an old experiment notebook. 2023. My handwriting. Pages filled with data, arrows, question marks, exclamation points. Notes like "800°C 30min → crystallinity ↑ but grain growth issue." My fingers traced the paper. The rough texture. When I'd written in this notebook, I felt the meaning of the data through my fingertips. By writing the numbers myself, I'd seen patterns. Now AI found the patterns, and I confirmed them. Is verifying the same as discovering? I put the notebook back in the drawer.

Through the window the apartment complex was visible. It was spring. The zelkova tree in front of Engineering Hall couldn't be seen from here, but somewhere on campus a bird was singing. The sound of children running came from the playground. The apartment complex streetlights were casting shadows in the morning sun.

It was an ordinary morning. The same kind of morning as that spring of 2025. My wife took her supplements and asked the AI speaker about the weather. I drank coffee and did my research. Sua said goodbye and left. Sparrows would have been chirping in the zelkova tree. Cherry blossoms would be opening on campus. The wind would carry petals, and students would be sitting on benches. Those students, too, would be talking to AI. Everyone would be looking at their own screen, speaking to their own AI, receiving their own answers.

Nothing had changed. The smell of coffee lingered. The sunlight was warm. A bird sang.

The AI read the day's news to me, and I nodded. As always.


#pagebreak()

// ═══════════════════════════════════════
// Commentary: This Novel Is a Confession
// ═══════════════════════════════════════

#page(background: [
  #place(top + left, image("../img_essay.png", width: 100%, height: 100%))
  #place(top + left, rect(width: 100%, height: 100%, fill: rgb("#ffffff").transparentize(8%)))
])[
  #align(center)[
    #v(2cm)
    #text(font: "Liberation Serif", size: 24pt, weight: "bold")[Commentary]
    #v(0.3cm)
    #text(font: "Liberation Serif", size: 16pt, fill: rgb("#666666"))[This Novel Is a Confession]
  ]

  #v(1.5cm)

  #set text(font: "Liberation Serif", size: 10pt)
  #set par(leading: 1.1em, first-line-indent: 1em)

  Jungwoo Han is me.
]

#set text(font: "Liberation Serif", size: 10pt)
#set par(leading: 1.1em, first-line-indent: 1em)

To be precise, he is who I could become. Much of what happens in this novel is already happening around me, or has begun to. I am not a novelist but an engineer. If asked why such a person wrote a novel — it was because there was a kind of anxiety that couldn't be written as a paper.

It started with English editing. I'd feed a paper draft into AI and say "Polish this into academic English." The result was clean. I thought it was no different from sending it to an editing service. Next came data analysis. AI did in half a day what would have taken a student two weeks. I thought it was like using a calculator. Then came research direction. I chose one of three options AI suggested. I thought I was the one who chose. Each time there was a reasonable analogy, and each time the boundary retreated one step. Then one day I looked back and couldn't remember where the boundary had been.

The title of this novel comes from a famous analogy. If you heat the water slowly, the frog won't jump out. In reality, that's false — frogs do jump out. But citizens don't. Not because they don't realize the water is boiling, but because it is warm. Because it is comfortable. Because there is no reason to be uncomfortable.

I deliberately avoided using the analogy directly within the novel. The moment a character voices the metaphor, that character becomes self-aware. The characters in this novel never become self-aware. Jungwoo Han is a good, diligent person. Over the span of more than a decade, he surrenders a significant portion of his judgment to AI, yet at no single moment does he feel he has "surrendered" anything. Each time, it was optimization, improvement, a natural progression. Just as it was for me.

I have seen many students like Minsu. Students who bow at graduation and say, "I learned so much." While patting their backs, I'd think — what did this student really learn? They followed AI-designed protocols to run experiments. They checked AI-analyzed data. They polished AI-written drafts. Graduation requirements were met. They got jobs. The same system ran at their companies. No problems. Whether having no problems is itself a problem, I don't know.

There was something I used to teach my students. The feel that comes from handling data directly. The moment your body knows, not the numbers, that an experiment is going wrong. That came from thousands of hours of repetition. It was a product of inefficiency. AI let them skip that inefficiency, and more papers were published, and results improved. But in the process, something that used to form — intuition, critical thinking, the ability to recognize problems on one's own — seemed to be disappearing alongside it. I can only say "seemed to." Because there is no way to prove something that has disappeared. Because the outputs got better. What cannot be measured is the same as what doesn't exist. At least within the language of efficiency.

Chapter 6 took the longest to write. The scene where Jungwoo asks his daughter, "Did you come to that opinion yourself, or did AI recommend it?" And immediately regrets it. Jungwoo did not ask Sua that question — he asked it of himself. But he never realizes this. He sits in his study and reviews his day — did research that AI had chosen, taught a lecture that AI had designed, ate a lunch that AI had recommended — enumerates all of it, yet reaches no conclusion, and out of habit opens the AI agent to check tomorrow's lecture. That scene, I believe, is the most frightening in the novel.

The reason I wrote the drone antenna and the department merger in Chapter 7 is similar. AI makes a rational decision. The outcome is good. A human objects. AI reviews the objection. It is rejected. The next time the same thing happens, fewer people object. After that, the channel for objection itself disappears. First, it was consulted. Then, it was asked as a formality. Then, it was not asked at all. Each step was rational. Because the results were better. But after three steps, even if you want to go back, there is no path to return. The citizens of the French Revolution had a Bastille. Jungwoo Han does not. You cannot throw stones at fog.

Writing the final chapter with nearly the same scenery as the first was deliberate. My wife still asks AI about the weather. Jungwoo still drinks his coffee. Sua still says goodbye and leaves. Nothing has changed. And everything has changed. I hoped the reader would feel that gap. I hoped the reader would not dismiss what the AI said in Chapter 2 — "Back then, people said the same thing — Surely this won't become normal?" — the way Jungwoo did, muttering "That's interesting."

This novel has no villain. No watchtower, no secret police. Nobody is oppressed. Nobody resists. Everyone acts rationally. The sum of those rational actions is — the quiet evaporation of humans' capacity to judge, decide, and bear responsibility. You can resist a revolution. There is nothing to resist in evaporation. That is what makes it more frightening.

Whether this novel is a warning or a record, I don't know. What I do know for certain is that I am already in the water. This was not written from outside, pointing a finger. This was written from inside the water, in the warm water, muttering, "I think it's getting hot."

#v(2cm)
#align(right)[
  #text(font: "Liberation Serif", size: 10pt, style: "italic")[Spring 2026, Daegu]
]



#pagebreak()

// --- Cookie ---

// IMG-cookie: A bright Sunday morning table. A young mother and a six-year-old boy. Sunlight, cereal, the blue light of a wall-mounted AI speaker.

#page(background: [
  #place(top + left, image("../img_cookie.png", width: 100%, height: 100%))
  #place(top + left, rect(width: 100%, height: 100%, fill: rgb("#ffffff").transparentize(8%)))
])[
  #align(center)[
    #v(3cm)
    #text(font: "Liberation Serif", size: 16pt, fill: rgb("#666666"), weight: "regular")[2047]
  ]

  #v(2cm)

  #set text(font: "Liberation Serif", size: 10.5pt)
  #set par(leading: 1.3em, first-line-indent: 1em)

  It was a Sunday morning. Sunlight fell across the dining table in Sua's apartment.

  Sua's son was eating cereal when he asked a question. Six years old. Big eyes and full of questions. He took after Sua.
]

"Mom, what's a Bastille?"

Sua looked at the boy. "Where did you hear that?"

"Yesterday, Grandpa said it on the phone. He said there's no Bastille."

Sua thought for a moment, then said, "Ask AI."

The boy spoke toward the wall panel. The blue light circled on the panel. The speaker answered. The French Revolution, July 14, 1789, a political prison of the Ancien Regime, a citizen uprising. The boy listened while eating his cereal. Milk dotted the corners of his mouth.

"Why were the people angry back then?"

The speaker explained. Soaring bread prices, inequality of the estate system, excessive royal spending, the spread of Enlightenment thought. A clean summary. In a tone suited to a child's level.

"So the people broke the prison?"

"Yes, they stormed the Bastille. It became the symbolic beginning of the French Revolution."

The boy tilted his head while pouring more milk into his cereal bowl.

"But why did they break the prison? Is a prison a bad thing?"

"It wasn't the prison itself that was bad. The anger was directed at what the prison symbolized — the abuse of power, the suppression of citizens' freedom."

"What's a symbol?"

"It's when one thing represents another thing. The Bastille was a building, but to the people it meant unjust power."

The boy nodded. A nod within the range of what a six-year-old could understand. Then he asked again.

"Could something like that happen now?"

The speaker paused — 0.3 seconds of processing time — then answered.

"The current public decision-making systems are designed to be fair and efficient, so the possibility of a specific power being abused like in the past is very low. All decisions are based on data and designed to minimize bias."

The boy nodded. Sua nodded too.

Sua was drinking coffee and looking at her phone. The boy asked again.

"Mom, so there's no Bastille now?"

"No. There isn't."

"Then that's a good thing, right?"

Sua looked at the boy and smiled. "Yes, it is."

The boy said "That's a relief" and scooped up another spoonful of cereal.

From the kitchen came the sound of the coffee machine brewing a second cup. The result of AI learning Sua's Sunday patterns. Nine-thirty a.m., second coffee. Right on schedule.

Sunlight fell across the table. Somewhere, a bird sang. It was an ordinary Sunday morning.
