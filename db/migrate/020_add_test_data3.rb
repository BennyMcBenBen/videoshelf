class AddTestData3 < ActiveRecord::Migration
  def self.up
    # start from scratch
    PackageLibrary.delete_all
    VideoLibrary.delete_all
    Wishlist.delete_all
    OnlineVideo.delete_all
    DiscVideo.delete_all
    Disc.delete_all
    Package.delete_all
    Video.delete_all
    Show.delete_all
    
    # create shows
    show_ad = Show.create(:title => 'Arrested Development',
      :description => 
      %{Arrested Development is a character-driven American television sitcom about a formerly wealthy, habitually dysfunctional family.},
      :image_url => 'arrested_development.png',
      :onair => false,
      :no_seasons => 3,
      :start_year => 2003,
      :end_year => 2006)
      
    show_shield = Show.create(:title => 'The Shield',
      :description => 
      %{The Shield is an American police-drama television series shown on FX Networks in the U.S. and other networks internationally. The show is known for its controversial portrayal of corrupt police officers and was originally advertised as "Rampart" in reference to the true life Rampart Division police scandal, which the show's Strike Team is loosely based upon. The first season gained the most Emmy nominations for a basic cable drama. The series was created by Shawn Ryan and The Barn Productions for Fox Television Studios and Sony Pictures Television (formerly Columbia TriStar Television).},
      :image_url => 'shield.jpg',
      :onair => true,
      :no_seasons => 7,
      :start_year => 2002,
      :end_year => 2008)
      
    show_fotc = Show.create(:title => 'Flight of the Conchords',
      :description => 
      %{Flight of the Conchords is an Emmy Award-nominated television comedy series that follows the adventures of the Flight of the Conchords, a folk duo from New Zealand, as its members seek fame and success in New York City. The show portrays a fictionalized version of the real-life duo, Jemaine Clement and Bret McKenzie, who play themselves.},
      :image_url => 'fotc.png',
      :onair => true,
      :no_seasons => 1,
      :start_year => 2007,
      :end_year => 2008)
      
    Show.create(:title => 'Home Movies',
      :description => 
      %{Home Movies is a dialogue-driven American animated series that originally aired from 1999 to 2004. The plot surrounds an eight-year-old Brendon Small (voiced by the creator, head writer, and lead musician of Home Movies, Brendon Small), who makes home films with his friends, Melissa Robbins and Jason Penopolis, in his spare time. He lives with his divorced mother, Paula, and his adopted baby sister, Josie. He is also friends with his alcoholic, short-tempered soccer coach, John McGuirk.},
      :image_url => 'home_movies.png',
      :onair => false,
      :no_seasons => 4,
      :start_year => 1999,
      :end_year => 2004)  
      
    Show.create(:title => 'Futurama',
      :description => 
      %{Futurama is an Emmy Award-winning animated American sitcom created by Matt Groening, and developed by Groening and David X. Cohen for the Fox network. The series follows the adventures of a former New York pizza delivery boy, Philip J. Fry, after he is cryogenically frozen, seconds before the start of the twenty-first century, and wakes up second before the year 3000 begins. In the United States, the series aired from March 28, 1999 to August 10, 2003 on Fox before ceasing production. Futurama was then aired on Adult Swim on Cartoon Network, from January 2003 to December 2007, when the network's contract expired. The series was revived in 2007 as four straight-to-DVD films which would then be split into a sixteen-episode fifth season.},
      :image_url => 'futurama.jpg',
      :onair => true,
      :no_seasons => 5,
      :start_year => 1999,
      :end_year => 2008) 
      
    Show.create(:title => 'Family Guy',
      :description => 
      %{Family Guy is an animated American television sitcom created by Seth MacFarlane that airs on Fox and regularly on other television networks in syndication. The show centers on a semi-dysfunctional family that lives in the fictional town of Quahog, Rhode Island. The show uses frequent "cutaway gags", jokes in the form of tangential vignettes. Family Guy was cancelled once in 2000 and again in 2002, but strong DVD sales and the large viewership of reruns on Cartoon Network's Adult Swim convinced Fox to resume the show in 2005. It is the first cancelled show to be resurrected based on DVD sales, and the only one to be resurrected twice on that basis.},
      :image_url => 'family_guy.png',
      :onair => true,
      :no_seasons => 7,
      :start_year => 1999,
      :end_year => 2008) 
      
    Show.create(:title => 'The Simpsons',
      :description => 
      %{The Simpsons is an American animated sitcom created by Matt Groening for the Fox Broadcasting Company. The series is a satirical parody of the middle class American lifestyle epitomized by its titular family, which consists of Homer, Marge, Bart, Lisa, and Maggie. The show is set in the fictional town of Springfield, and lampoons many aspects of the human condition including American culture, society, and television. The family was conceived by Groening shortly before a pitch for a series of animated shorts with the producer James L. Brooks. Groening created a dysfunctional family and named the characters after members of his own family, substituting Bart for his own name. The shorts became a part of The Tracey Ullman Show on April 19, 1987. After a three-season run, the sketch was developed into a half-hour prime time show and was an early hit for Fox, becoming the first Fox series to land in the Top 30 ratings in a season (1992-1993).},
      :image_url => 'simpsons.png',
      :onair => true,
      :no_seasons => 20,
      :start_year => 1989,
      :end_year => 2008)       
      
    # create episodes
    ad101 = Episode.create(:show => show_ad,
      :title => 'Pilot',
      :description =>
      %{Michael anticipates becoming the new president of his father's homebuilding company, having put up with his family for years in order to achieve it. This includes living in the attic of a model home with his son George Michael, and learning his sister Lindsay, brother-in-law Tobias and niece Maeby have been in town for a month without telling him. Instead, the position is given to his mother Lucille, shortly before his father George Sr. is arrested. Michael, reluctantly, returns to run the family business to steer them while his father is incarcerated, and Lindsay decides to become close to Michael again.},
      :image_url => 'arrested_development101.jpg',
      :year => 2003,
      :season_no => 1,
      :season_ep_no => 1,
      :length => 22)
      
    shield101 = Episode.create(:show => show_shield,
      :title => 'Pilot',
      :description =>
      %{Four months into the "Farmington Project", Detective Vic Mackey and his Strike Team prepare to take down a major drug dealer who has never before been caught with product. Meanwhile, following a homicide, Wyms and Wagenbach discover that a child is missing, sold to a paedophile by her drug-addicted father.},
      :image_url => 'shield1.jpg',
      :year => 2002,
      :season_no => 1,
      :season_ep_no => 1,
      :length => 45)
      
    shield102 = Episode.create(:show => show_shield,
      :title => 'Our Gang',
      :description =>
      %{After the death of a member of the Strike Team on a high-risk raid, Aceveda begins to investigate the real circumstances behind the raid. Lowe and Sofer find a dying man being mugged, eventually linked to a Mexican gang.},
      :image_url => 'shield1.jpg',
      :year => 2002,
      :season_no => 1,
      :season_ep_no => 2,
      :length => 45)
      
    shield103 = Episode.create(:show => show_shield,
      :title => 'The Spread',
      :description =>
      %{It's Sweep-day on the Farm, with all outstanding warrants to be served. Mackey and the Strike Team move to take down an old foe, arresting a basketball star in the process, seeing a chance to affect sports history and make some money in the process.},
      :image_url => 'shield1.jpg',
      :year => 2002,
      :season_no => 1,
      :season_ep_no => 3,
      :length => 45)
      
    shield104 = Episode.create(:show => show_shield,
      :title => 'Dawg Days',
      :description =>
      %{A gunfight breaks out in a crowded club between two local rappers which could potentially start a gang war. To further complicate matters, one of Mackey's contacts was involved in the shootout. Mackey and the Strike Team try to prevent the conflict from escalating.},
      :image_url => 'shield1.jpg',
      :year => 2002,
      :season_no => 1,
      :season_ep_no => 4,
      :length => 45)
      
    shield105 = Episode.create(:show => show_shield,
      :title => 'Blowback',
      :description =>
      %{Aceveda insists that Mackey take uniformed cops in with them to bust an Armenian gang's drug delivery. After the bust, Margos Dezerian is caught among the Armenian gang and Lowe sees the Team take a portion of the drugs for themselves. But in the end Vendrell ends up having the drugs and the vehicle they're in stolen from them. While the search for the drugs and the truck goes on, Mackey learns that his son is autistic.},
      :image_url => 'shield1.jpg',
      :year => 2002,
      :season_no => 1,
      :season_ep_no => 5,
      :length => 45)
    
    shield106 = Episode.create(:show => show_shield,
      :title => 'Cherrypoppers',
      :description =>
      %{When the body of a young hooker is found in the district, Wagenbach and Wyms get the full resources of the Barn for 24 hours and the help of the FBI to search for Wagenbach's serial killer. Meanwhile, The Strike Team busts an underage prostitution ring, and Capt. Aceveda continues to investigate Mackey.},
      :image_url => 'shield1.jpg',
      :year => 2002,
      :season_no => 1,
      :season_ep_no => 6,
      :length => 45)

    shield107 = Episode.create(:show => show_shield,
      :title => 'Pay in Pain',
      :description =>
      %{When Mackey and Vendrell hook up with a cop from another precinct to investigate the shooting, Vendrell sets off an explosive confrontation with a suspect by making a racial slur; fortunately, Mackey defuses the situation. Wagenbach and Wyms search for a serial killer and bring in a psychic on a complaint from the son of one of her clients, and Aceveda calls internal affairs after getting Lowe's affidavit.},
      :image_url => 'shield1.jpg',
      :year => 2002,
      :season_no => 1,
      :season_ep_no => 7,
      :length => 45)      
 
    shield108 = Episode.create(:show => show_shield,
      :title => 'Cupid & Psycho',
      :description =>
      %{Allegations against the Strike Team are front-page news, and the team is broken up pending the investigation. Mackey threatens to reveal that Officer Lowe is gay if he won't recant his statement about the Strike Team. In the meantime, Mackey and Wyms find themselves following the trail of a batch of "cupid" meth, while Vendrell and Wagenbach try to get along on a case.},
      :image_url => 'shield1.jpg',
      :year => 2002,
      :season_no => 1,
      :season_ep_no => 8,
      :length => 45)   

    shield109 = Episode.create(:show => show_shield,
      :title => 'Throwaway',
      :description =>
      %{A planted gun in a truck-jacking case causes complications for the Strike Team, and now they're left to clean up their own mess. The rift between Officers Lowe and Sofer deepens, causing Aceveda to intervene. Wyms deals with the mess of her family during a visit from her daughter.},
      :image_url => 'shield1.jpg',
      :year => 2002,
      :season_no => 1,
      :season_ep_no => 9,
      :length => 45)  
      
    shield110 = Episode.create(:show => show_shield,
      :title => 'Dragonchasers',
      :description =>
      %{Mackey helps Connie quit her crack addiction by going cold-turkey in her desperate attempt to keep her son, leaving Vendrell and Lemansky to investigate a strip-club mugging ring. Wagenbach follows his instincts on a serial killer case and Sofer is bitten by an HIV-infected perpetrator.},
      :image_url => 'shield1.jpg',
      :year => 2002,
      :season_no => 1,
      :season_ep_no => 10,
      :length => 45)  
      
    shield111 = Episode.create(:show => show_shield,
      :title => 'Carnivores',
      :description =>
      %{The Strike Team mediates a dispute between Rondell Robinson and the Nation of Islam while Wagenbach and Wyms investigate a brutal home invasion in the tight lipped Korean community. Aceveda revisits his past.},
      :image_url => 'shield1.jpg',
      :year => 2002,
      :season_no => 1,
      :season_ep_no => 11,
      :length => 45)  

    shield112 = Episode.create(:show => show_shield,
      :title => 'Two Days of Blood',
      :description =>
      %{While Mackey answers Assistant Chief Gilroy's call for help in covering up a hit and run before Wagenbach intuits the facts of the case, Vendrell and Lemansky follow the trail of a gunrunner with a penchant for cockfights. Aceveda turns to Wyms after a double homicide raises ire and fear within an ignored community.},
      :image_url => 'shield1.jpg',
      :year => 2002,
      :season_no => 1,
      :season_ep_no => 12,
      :length => 45)  
      
    shield113 = Episode.create(:show => show_shield,
      :title => 'Circles',
      :description =>
      %{In the aftermath of a riot, cops are being lured into ambush shootings by a rash of bogus 911 calls. Mackey and Captain Aceveda must work together to stop these attacks and solve the problems in The Grove, while Assistant Chief Gilroy tries to pit the two against each other to save his own job.},
      :image_url => 'shield1.jpg',
      :year => 2002,
      :season_no => 1,
      :season_ep_no => 13,
      :length => 45)    
      
    Episode.create(:show => show_fotc,
      :title => 'Sally',
      :description =>
      %{Bret and Jemaine go to a party at Dave's place where Jemaine sees, and falls for, a beautiful girl named Sally. Jemaine's growing relationship leaves Bret feeling neglected and Murray helps the band film a music video.},
      :image_url => 'fotc101.jpg',
      :year => 2007,
      :season_no => 1,
      :season_ep_no => 1,
      :length => 25)       
      
    # create films
    pootie = Video.create(
      :title => 'Pootie Tang',
      :description =>
      %{A spin-off character from HBO's "The Chris Rock Show," Pootie Tang (Lance Crouther) is an indefatigable crime fighter (and recording sensation) who speaks in an indecipherable patois. But to children everywhere, he's a heroic role model. In this feature-length outing, Pootie mixes it up with an evil CEO who wants kids to smoke, drink and eat fast food.},
      :image_url => 'pootie_tang.jpg',
      :year => 2001,
      :length => 81)
    Package.create_simple_dvd(pootie)
      
    Video.create(
      :title => 'The Boondock Saints',
      :description =>
      %{Twin brothers Conner (Sean Patrick Flanery) and Murphy (Norman Reedus), feeling that their God-given mission is to cleanse the earth of all human evil, set out to rid Boston of crime. But instead of joining the police force, these Irish Americans decide to kick criminal butt their own way -- à la Charles Bronson. Willem Dafoe is the openly gay FBI special agent assigned to investigate.},
      :image_url => 'boondock_saints.jpg',
      :year => 1999,
      :length => 110)
      
    Video.create(
      :title => 'UHF',
      :description =>
      %{George Newman ("Weird Al" Yankovic) takes over the low-rent TV station his uncle Harvey (Stanley Brock) won in a poker game. George's unconventional methods for boosting ratings include giving the station's janitor, Stanley Spidowski (Michael Richards), his own children's program -- with spectacular results. But complications ensue when R.J. Fletcher (Kevin McCarthy), the unscrupulous head of a rival network, tries to drive George off the air.},
      :image_url => 'uhf.jpg',
      :year => 1989,
      :length => 97)
    
    Video.create(
      :title => 'Chinatown',
      :description =>
      %{Private eye J.J. Gittes (Jack Nicholson) uncovers intricate dirty dealings in the Los Angeles waterworks and gets his nose slashed for his grief. Suspicious, porcelain-skinned femme fatale Faye Dunaway (who harbors a nasty family secret) finances Gittes's snooping. Director Roman Polanski reimagines 1930s Los Angeles in this brilliant detective thriller. And Robert Towne's onion-like script reveals itself one complex layer at a time.},
      :image_url => 'chinatown.jpg',
      :year => 1974,
      :length => 130)
      
    Video.create(
      :title => 'Munich',
      :description =>
      %{In this thriller based on actual events, Palestinian terrorists hold hostage and ultimately kill a group of Israeli athletes during the 1972 Munich Summer Olympics. In the tragic aftermath of the infamous murders, a Mossad agent (Eric Bana) tracks down the assassins. Ciaran Hinds and Geoffrey Rush co-star in this film directed by Steven Spielberg and written by Tony Kushner (award-winning playwright of "Angels in America").},
      :image_url => 'munich.jpg',
      :year => 2005,
      :length => 164)
      
    Video.create(
      :title => 'Serenity',
      :description =>
      %{Picking up where his cult show "Firefly" left off, writer-director Joss Whedon's tale of galactic unrest follows Malcolm Reynolds (Nathan Fillion), captain of the transport ship Serenity, and his scrappy but loyal crew. When the ship picks up two new passengers -- fugitives from the powerful coalition ruling the universe -- "Mal" and his mates find themselves at the center of a cosmic conflict, pursued by military forces and space-roaming savages.},
      :image_url => 'serenity.jpg',
      :year => 2005,
      :length => 119)
      
    Video.create(
      :title => 'This Is Spinal Tap',
      :description =>
      %{This satire about a fictional heavy metal group named Spinal Tap spoofs nearly every facet of rock 'n' roll -- from vacuous modern songwriting to half-baked album promos to pyrotechnic concerts. Michael McKean, Christopher Guest and Harry Shearer portray the washed-up, aging British rockers whose tresses and egos outstrip their talent. Chronicling the band's evolution and its calamitous comeback tour is filmmaker Marty DiBergi (Rob Reiner).},
      :image_url => 'this_is_spinal_tap.jpg',
      :year => 1984,
      :length => 82)
      
    Video.create(
      :title => 'Kill Bill: Vol. 1',
      :description =>
      %{In this film noir tale written and directed by Quentin Tarantino, an assassin called the Bride (Uma Thurman) is shot at her wedding by her employer, Bill (David Carradine), and other members of their assassin circle. She survives, though a bullet in her brain keeps her in a coma for five years. Setting out for some payback, the Bride hunts down the various assassins, saving Bill for last. This is the first half of a planned two-part movie.},
      :image_url => 'kill_bill_vol1.jpg',
      :year => 2003,
      :length => 111)
      
    Video.create(
      :title => 'Kill Bill: Vol. 2',
      :description =>
      %{The second half of Quentin Tarantino's outrageously inventive Kill Bill series is just as murderously brilliant as the first. The Bride (Uma Thurman) wakes up from a coma five years after she was shot in the head. Revenge is on her mind, and she sets out to pick off her ex-mentor's band of assassins one by one, until there's nothing left to do but … kill Bill (David Carradine). Co-stars Lucy Liu, Vivica Fox and Michael Madsen.},
      :image_url => 'kill_bill_vol2.jpg',
      :year => 2004,
      :length => 136)     
      
    Video.create(
      :title => 'Talladega Nights: The Ballad of Ricky Bobby',
      :description =>
      %{Lifelong friends and national idols Ricky Bobby (Will Ferrell) and Cal Naughton Jr. (John C. Reilly) have earned their NASCAR stripes with their uncanny knack of finishing races in the first and second slots, respectively. But when rival French driver Jean Girard (Sacha Baron Cohen) coasts onto the track to challenge the duo, they'll have to floor it to retain their status as top dogs.},
      :image_url => 'talladega_nights.jpg',
      :year => 2006,
      :length => 122)       
      
    Video.create(
      :title => 'Anchorman: The Legend of Ron Burgundy',
      :description =>
      %{Will Ferrell is hilarious as Ron Burgundy, a big-shot news anchor in 1970s San Diego. Ron's reign over the newsroom is questioned when a hardworking feminist reporter, Veronica Corningstone (Christina Applegate), shows up and tears the station up with her new ideas. At first, Ron pretends he's hip to the changes, but when he tires of it, the true-blue chauvinist in him declares an all-out war.},
      :image_url => 'anchorman.jpg',
      :year => 2004,
      :length => 94)       
      
    Video.create(
      :title => 'Tommy Boy',
      :description =>
      %{Party animal Tommy Callahan (Chris Farley) is a few cans short of a six-pack. But when the family business starts tanking, it's up to Tommy and number-cruncher Richard Hayden (David Spade) to save the day. "Saturday Night Live" stars Farley and Spade take off like rockets in this riotous road comedy, where every wrong turn leads to laughter.},
      :image_url => 'tommy_boy.jpg',
      :year => 1995,
      :length => 97)        
      
    Video.create(
      :title => 'Super Troopers',
      :description =>
      %{Bored, occasionally high and always highly ineffective Vermont state troopers Mac (Steve Lemme), Thorny (Jay Chandrasekhar, who also directed), Foster (Paul Stoter) and Rabbit (Erik Stohlanske) must prove their worth to Governor Jessman (Lynda Carter) -- or lose their jobs. After stumbling on a drug smuggling ring, they plan to make a high-profile bust, but the rival police of Earlville are out to steal the glory in this irreverent comedy.},
      :image_url => 'super_troopers.jpg',
      :year => 2002,
      :length => 100)      
      
    Video.create(
      :title => 'Jay and Silent Bob Strike Back',
      :description =>
      %{Jay (Jason Mewes) and Silent Bob (Kevin Smith), the drug-dealing stoners who've made cameo appearances in a clutch of Smith's films, are back and starring in their own flick! When Jay and Bob learn that their comic-book alter egos, Bluntman and Chronic, have been sold to Hollywood as part of a big-screen movie -- but that they're out any royalties -- the pair travels to Tinseltown to sabotage the production.},
      :image_url => 'jay_and_silent_bob_strike_back.jpg',
      :year => 2001,
      :length => 104)  
      
    Video.create(
      :title => "Monty Python's Life of Brian",
      :description =>
      %{The crown princes of British comedy are at it again -- this time, in a send-up of the life and times of Jesus Christ. Perhaps the most controversial (and offensive, to some) Python film, Life of Brian tells the tall tale of a peasant boy born the same night as the Christ child -- in an adjoining stable. Laughs mount as their lives increasingly intersect.},
      :image_url => 'life_of_brian.jpg',
      :year => 1979,
      :length => 94)     
      
    Video.create(
      :title => 'Sin City',
      :description =>
      %{Murder, corruption and cover-ups are all part of Sin City's daily routine in this dark film that weaves three tales from Frank Miller's graphic novels. Marv (Mickey Rourke) is a psychotic outcast who seeks vengeance for Goldie's (Jaime King) murder; Dwight (Clive Owen) kills a cop and must cover it up; and nearly retired cop Hartigan (Bruce Willis) is accused of a crime he didn't commit. Benicio Del Toro, Jessica Alba and Rosario Dawson co-star.},
      :image_url => 'sin_city.jpg',
      :year => 2005,
      :length => 126)
      
    # packages
    shield_s1 = Package.create(
      :title => 'The Shield: Season 1',
      :description =>
      %{Vic Mackey (Michael Chiklis) leads the Strike Team unit, a posse of Los Angeles rogue cops with a great track record of fighting crime. Vic calls the shots with the team, but trouble brews when a new captain is assigned to the precinct. The problem? The new captain can't abide by Vic's renegade tactics, and he wants Vic out. The series won an Emmy Award in 2002 for Outstanding Lead Actor in a Drama Series (Chiklis).},
      :image_url => 'shield1.jpg',
      :no_discs => 4,
      :form => 'show',
      :format => 'dvd')
    shield_s1_d1 = Disc.create(
      :package => shield_s1,
      :disc_no => 1)
    shield_s1_d2 = Disc.create(
      :package => shield_s1,
      :disc_no => 2)
    shield_s1_d3 = Disc.create(
      :package => shield_s1,
      :disc_no => 3)
    shield_s1_d4 = Disc.create(
      :package => shield_s1,
      :disc_no => 4)
    DiscVideo.create(
      :disc => shield_s1_d1,
      :video => shield101)
    DiscVideo.create(
      :disc => shield_s1_d1,
      :video => shield102)
    DiscVideo.create(
      :disc => shield_s1_d1,
      :video => shield103)
    DiscVideo.create(
      :disc => shield_s1_d1,
      :video => shield104)
    DiscVideo.create(
      :disc => shield_s1_d2,
      :video => shield105)
    DiscVideo.create(
      :disc => shield_s1_d2,
      :video => shield106)
    DiscVideo.create(
      :disc => shield_s1_d2,
      :video => shield107)
    DiscVideo.create(
      :disc => shield_s1_d2,
      :video => shield108)
    DiscVideo.create(
      :disc => shield_s1_d3,
      :video => shield109)
    DiscVideo.create(
      :disc => shield_s1_d3,
      :video => shield110)
    DiscVideo.create(
      :disc => shield_s1_d3,
      :video => shield111)
    DiscVideo.create(
      :disc => shield_s1_d3,
      :video => shield112)
    DiscVideo.create(
      :disc => shield_s1_d4,
      :video => shield113)
      
    # online videos
    OnlineVideo.create(
      :video => ad101,
      :embed =>
      %{<object width="512" height="296"><param name="movie" value="http://www.hulu.com/embed/xPyB2UBP6a87Du3mMismQg"></param><embed src="http://www.hulu.com/embed/xPyB2UBP6a87Du3mMismQg" type="application/x-shockwave-flash" width="512" height="296"></embed></object>})
  end

  def self.down
    PackageLibrary.delete_all
    VideoLibrary.delete_all
    Wishlist.delete_all
    OnlineVideo.delete_all
    DiscVideo.delete_all
    Disc.delete_all    
    Package.delete_all
    Video.delete_all
    Show.delete_all
  end
end
