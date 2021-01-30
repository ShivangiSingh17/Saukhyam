import 'dart:core';

import 'package:flutter/material.dart';
import 'file:///C:/Users/sidga/AndroidStudioProjects/saukhyam/lib/lang/engString.dart';


var textUtils;
class StringUtils{

  //pg1 - Home
  //pg2 - YSwitch
  //pg3 - Wash wear
  //pg4 - FAQ
  //pg5 - Contact



  //About Us Expandables
  //About us

  static const List<String> exp2 = [

    'SAUKHYAM MEANS HAPPINESS AND WELL BEING',
        'Our Inspiration ',
        'Saukhyam As First Choice For Women:',
        'Saukhyam Is Eco-Friendly:',
        'Cost Efficient:'

  ];


  static const List<String> exp22 = [

  "We chose the name Saukhyam for our reusable pads because we believe menstruation has been undervalued and ignored for too long. Women give birth to every human being and menstruation makes that cycle possible. When you switch to our beautiful reusable pads, you are celebrating the life cycle and honoring your place in it.\n\nSaukhyam Reusable Pads were honored with Most Innovative Product Award (2016) by the National Institute of Rural Development, India.\n\nThe project was lauded at UN Climate Change Conference (2018) in Poland for its sustainable financing mechanism.\n\nIn 2020, the Saukhyam team was recognized as the Social Enterprise of the Year for it's exceptional impact, clarity and growth of work dedicated to furthering the UN Sustainable Development Goals from the Women for India and Social Founder Network coalition." ,
  "Saukhyam Reusable Pads is a project of the Mata Amritanandamayi Math. The Math is an NGO with consultative status to the UN's ECOSOC. It is led by Amma, Sri Mata Amritanandamayi Devi, revered worldwide as a spiritual and humanitarian leader. When the Math adopted remote village clusters in 20 states of India in 2013, with the goal to transform them into role models of sustainable development, the foundation was laid for the pads project.",
  'The National Family Health Survey (2015-16) of the Ministry of Health and Family Welfare revealed that only 48.2% girls in the age group of 15-24 years used hygienic methods of protection during menstrual periods in rural India as compared to 77.5% in urban India. Further, an overwhelming number of health problems faced by women in rural areas were traced back to one single factor - the absence of proper menstrual hygiene.\n\nToday Saukhyam Reusable Pads are used by thousands of women and girls not only in rural areas but also towns and cities of India and worldwide.\n\nPerhaps what appeals to rural women is the low price and easy availability of these pads. Women self help groups in several states of India produce and market Saukhyam Reusable Pads. In urban India, the educated informed woman is making a switch because these pads are better for the environment and for our health. ' ,
  "It is not widely known but it is true. Just like trees are cut to make paper, trees are also cut to make the absorbent material in 99% of disposable pads made and sold globally.\n\nBanana fiber is an excellent absorbent. It is also a type of cellulose fiber. However, it is obtained from agricultural waste; no trees are cut to extract the fiber. India is the largest producer of bananas in the entire world. This fruit tree has a unique property - it fruits only once. After the fruit is obtained in 8-9 months, the tree is cut for it will never bear fruit again.\n\n\"Even though banana fiber comes from waste, one must understand that it is too precious to be used just once and thrown away\", Amma said. " ,
    " Saukhyam pads are a good solution because they are better for women's health and don't contain harmful chemicals like disposable sanitary pads do. Saukhyam pads are cost effective as well, as you only need to purchase them once and then you are set for your entire cycle.\n Every year, an average woman will typically spend about two thousand rupees for buying disposable pads. Saukhyam Reusable Pad sets that half or even one-fourth of this amount last for 4-5 years and help one realize considerable cost savings. The cumulative savings, if switching to reusable pads, would be in excess of half a lakh of rupees when calculated over the entire menstruating lifetime. "

  ];




  //FAQ
  static const List<String> exp = [
    'Why are women switching to reusable pads? Is it mostly older women or even younger women that make the switch ?',
    'How do reusable pads help us save money ?',
    'Reusable pads make sense but I am not sure I will like to wash used pads. How is it that girls and women who switch do not have a problem with washing ? ',
    'There are 2 different types of Saukhyam Reusable Pads. Can you explain the difference between them?',
    'Why is banana fiber used for absorption in Saukhyam Reusable Pads ?  ',
    'I am a heavy bleeder. What kind of set is right for me? '
        'How often should I change the pad?',
    'When there is a heavy flow, does the pad feel wet?',
    'How does one wear the pad?',
    'What is the leak-proof layer ?',
    'How does one wash and reuse the pad?',
    'If I cannot wash my soiled pad immediately after use, what should I do?',
    'Is it hygienic to use reusable pads?',
    'Do you organize awareness programs?',
    'How long do these reusable pads last?',
    'How many reusable pads will I need for my monthly cycle?',
    'Can the reusable pad cause a skin rash?',
    'When traveling, how do I manage using reusable pads?',
    'Who makes Saukhyam Reusable Pads ?',
    'Where is Amrita SeRVe working ?',
  ];
  static const List<String> exp1 = ['Switching to reusable pads is the choice many educated and well-informed girls and women are making today. All over the world, folks are becoming increasingly aware of the health risks and the environmental problems caused by disposable sanitary pads and are choosing reusable pads over disposable ones.\n\nGirls and women realize that it takes less time to wash a used pad as compared to shopping for disposable pads every month.\n\nFrankly, it has surprised us to see that large numbers of women making the switch. Many in their 20s, 30s and even 40s invest in a set of reusable pads. Our team conducts awareness sessions in schools, and it makes us really happy when teenagers choose reusable options over disposable pads. These smart youngsters understand that switching to reusable pads will ultimately help them save a lot of money as well.',
    'Every year, an average woman will typically spend about two thousand rupees for buying disposable pads. Saukhyam Reusable Pad sets that half or even one-fourth of this amount last for 4-5 years and help one realize considerable cost savings. The cumulative savings, if switching to reusable pads, would be in excess of half a lakh of rupees when calculated over the entire menstruating lifetime. ',
    'Our menstrual blood is not a waste product that is in the same category as urine or feces. Because one did not conceive, the blood that would have otherwise been used to nourish a fetus is no longer needed in the body and is discarded. In many ancient cultures including the Indian culture, this blood was used to make fields more fertile. Menstrual blood is a source of micro-nutrients. There is research ongoing in international universities for isolating stem cells from menstrual blood that can be used for the treatment of diseases.\n\nOur used pads that are disposable smell awful but its not the menstrual blood that is the reason for that smell. For a healthy woman, the menstrual blood should not have any disgusting odor. Reusable pads do not smell and they are designed in such a way that they do not easily stain. Washing is easy; no extensive scrubbing is required. If washing was not an easy task that could be done within 5 minutes, we would not see so many making the switch. Try it. Most people do not report any problems with washing. If anything, they say that the ritual of washing has helped them better connect to their own bodies.',
    'There is the older Select line and the newer Essential line of pads.\n\nThe team has been trying hard from the very beginning to make reusable pads more mainstream. Although reusable pads represent a clear cost savings when compared to the cumulative amount spent on disposable pads over several months, they do entail a one-time upfront investment. The Essential line was introduced in order to make the pads affordable to all sections of society.\n\nThe amount of banana fiber, the fabric type and the pad design are different for the two lines. However, both lines offer adequate protection and a hygienic means to manage menstruation. With the introduction of the Essential line of pads, Saukhyam Reusable Pads are perhaps among the lowest-priced brands of reusable pads available in India today.\n\nThe team also distributes the Essential line in rural areas completely free. These pads are stitched by volunteers, with additional volunteers extract the banana fiber. ',
    'Many commercially available disposable pads use cellulose fiber (aka fluff pulp) for absorption. This is derived from trees and made in much the same manner as paper is made. We all know that using a lot of paper is harmful for the environment but we do not know that using a lot of disposable pads also is equally bad.\n\nTo this cellulose fiber, SAP (super absorbent polymer) is usually added for increased absorption. This is a suspected carcinogen.\n\nBanana fiber is a naturally occurring material that is the absorbent in Saukhyam pads. It is also a type of cellulose fiber but with an important difference. The banana is the only tree that gives fruits only once. After the banana harvest is obtained, the tree is cut down. The fiber is extracted from the trunk of the cut-down tree and no trees are cut to extract cellulose fiber.\n\nToday, tons of banana trunks are discarded every year. Amma encouraged us to make use of banana fiber for reusable pads, after our testing process revealed that they help make the pads more absorbent, soft and durable. Our team has obtained a patent on these pads. There are other teams in the world that have similarly filed patents for reusable pads with cores made from hemp fiber, bamboo fiber, etc.  ',
    'Within the Essential line, the base and insert together should be adequate for most heavy bleeders as well. Within the Select line, if one has heavy bleeding, then the 3-fold insert might be more suitable. Otherwise, women also use two 2-fold inserts together. Finally, the night pad insert can also be used as a 4-fold insert with the day base for extra heavy flows.  ',
    'For the most part, reusable pads can be changed just as often as you would change a disposable pad. That is, every 4-5 hours, depending on how heavy your flow is. The 3-fold and 4-fold inserts are meant to last for more numbers of hours. The night pad also offers protection for several hours. ',
    'The liquid gets absorbed into the inner layers of the banana fiber. Some clots might stay on the surface. If the pad starts to feel wet, it just means that it is time to change to a fresh one. Regular users report feeling less wetness and more comfort with cloth against their body as compared to sticky plastic pads. ',
    'Please see the videos demonstrating the use of pads. For the Select banana fiber pads, the insert is tucked inside the base. All pads come with a leak proof layer and have wings which fold around your underwear and are secured with a button. Well-fitting underwear offers the best results',
    'There is a leak-proof layer in the bases for the banana fiber pads – both for the day and the night pads. This is made for PUL (poly urethane laminate) and is the same kind of fabric that umbrellas are made of. Every single reusable pad brand in the world has this leak-proof layer. Although some argue that this is plastic (and the buttons are plastic as well), we would like to remind that these pads are not single-use items. At the end of their lifetime, this layer can be taken apart and recycled. ',
    'The pads can be washed either by hand or in the washing machine. First, soak the soiled pads in cold water for about 5 minutes. Or rinse under a tap. After this, wash the pads just like you would wash any of your other clothes, either by hand or machine. Make sure you hang up the pads to dry in sunlight or use a dryer. Once washed and dried, the pad is ready for use again.\n\nIt is perfectly ok to use an iron during the rainy season if the pads are taking a little longer to dry. Some women get creative and use their hair dryers as well to dry their pads. ',
    'You can use a plastic or ziplock bag to store soiled pads until they are ready to be washed. Our pouch in the Essential line has pockets in which used pads can be brought back home from work or school / college in a discreet manner. If you are not ok with the idea of folding a used pad and keeping it away for washing later, just hold it under a running tap for a minute or so and squeeze out all the blood. Then fold the wet but clean pad and keep it away for proper washing after returning home.\n\nMany who buy reusable pads at first use them only at home because they want to wash them immediately after use. However, several users who get used to the comfort offered by these pads figure out a way to use the pads at work or in school / college or even while traveling. On our team, almost all of us now are very comfortable using these pads even when we travel.  ',
    'If one takes proper care of the reusable pad, then it is perfectly hygienic to keep reusing the pads. After soaking the soiled pad in cold water for about 5 minutes or so, wash it properly. Drying of the washed pad in direct sunlight will further help sanitize the pad and make it ready for reuse again. Alternately drying in a dryer is just fine too.',
    'Yes, we conduct awareness sessions in schools, colleges and corporations. If you would like to schedule a session, please get in touch with us at info@saukhyampads.org.',
    'A Saukhyam Reusable Pad can last 4-5 years, depending on the care it receives.',
    'We suggest buying our ready-made packs to have enough pads to comfortably go through the monthly cycle. The full cycle pack in the Essential line should be adequate for most users. In the Select line, the super pack is especially popular. In fact, to-date we have sold far more super packs on this website than any other type of pack.\n\nAlternately, you can assemble your own pack based on your unique requirements. In the Essential line we do not sell individual pieces.',
    'Not at all. The soft cotton material that Saukhyam Reusable Pads are made out of enables free air flow that prevents the growth of anaerobic bacteria that can cause irritation and rashes. In fact, during a survey recently conducted, 70 out of 86 respondents said that with reusable pads they would experience rashes and after switching to Saukhyam, they now have no rashes at all. (The other 16 respondents did not experience rashes earlier and did not have rashes now as well).',
    'One can manage just fine. The soiled pads can be kept in a pouch to be washed and dried when you reach your destination.',
    'As part of Embracing the World’s Amrita SeRVe (Self Reliant Village) project to help 101 villages throughout India achieve empowerment and sustainability, rural women across India are trained in the production of the eco-friendly Saukhyam Reusable Pads for distribution and sales throughout the world.',
    'Since its inception in 2013, Amrita SeRVe has supported its target communities in 20 states of India in successfully addressing a wide range of issues, ranging from literacy and food security to sustainable farming and empowering women. It is working in village clusters in the states of Andhra, Bihar, Chattisgarh, Gujarat, Haryana, Himachal Pradesh, Jammu and Kashmir, Jharkhand, Karnataka, Kerala, Madhya Pradesh, Maharashtra, Odhisa, Punjab, Rajasthan, Tamil Nadu, Telengana, Uttar Pradesh, Uttarakhand and West Bengal.\n\nProceeds from the sales of Saukhyam Reusable Pads support various village developmental activities, including health and education programs for girls in the villages.',

  ];




}