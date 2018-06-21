# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cycles = "03 - Genesis,
05 - Spin,
07 - Lunar,
09 - SanSan,
11 - Mumbad,
12 - Flashpoint,
13 - Red Sand,
16 - Kitara"

cycles.split(',').each do |cycle|
  c = cycle.split('-')
  Cycle.create(order: c[0].strip, name: c[1].strip)
end

boxes = "01 - Draft IDs,
02 - Core,
04 - Creation and Control,
06 - Honor and Profit,
08 - Order and Chaos,
10 - Data and Destiny,
14 - Terminal Directive,
15 - Revised Core"

boxes.split(',').each do |box|
  b = box.split('-')
  Box.create(order: b[0].strip, name: b[1].strip)
end

packs = {
  "Genesis" => 
    "01 - What Lies Ahead,
    02 - Trace Amount,
    03 - Cyber Exodus,
    04 - A Study in Static,
    05 - Humanity_s Shadow,
    06 - Future Proof",
  "Spin" =>  
    "01 - Opening Moves,
    02 - Second Thoughts,
    03 - Mala Tempora,
    04 - True Colors,
    05 - Fear and Loathing,
    06 - Double Time",
  "Lunar" =>  
    "01 - Upstalk,
    02 - The Spaces Between,
    03 - First Contact,
    04 - Up and Over,
    05 - All That Remains,
    06 - The Source",
  "SanSan" =>  
    "01 - The Valley,
    02 - Breaker Bay,
    03 - Chrome City,
    04 - The Underway,
    05 - Old Hollywood,
    06 - The Universe of Tomorrow",
  "Mumbad" =>  
    "01 - Kala Ghoda,
    02 - Business First,
    03 - Democracy and Dogma,
    04 - Salsette Island,
    05 - The Liberated Mind,
    06 - Fear the Masses",
  "Flashpoint" =>  
    "01 - 23 Seconds,
    02 - Blood Money,
    03 - Escalation,
    04 - Intervention,
    05 - Martial Law,
    06 - Quorum",
  "Red Sand" =>  
    "01 - Daedalus Complex,
    02 - Station One,
    03 - Earth_s Scion,
    04 - Blood and Water,
    05 - Free Mars,
    06 - Crimson Dust",
  "Kitara" =>  
    "01 - Sovereign Sight,
    02 - Down the White Nile,
    03 - Council of the Crest,
    04 - The Devil and the Dragon,
    05 - Whispers in Nalubaale,
    06 - Kampala Ascendent"
}

packs.each do |cycle_name, data| 
  cycle = Cycle.where(name: cycle_name).take
  data.split(',').each do |pack|
    x = pack.split('-')
    Pack.create(order: x[0].strip, name: x[1].strip, cycle: cycle)
  end
end

cards = {
  "What Lies Ahead" => 
    "001 - Whizzard - Master Gamer.jpg,
    002 - Spinal Modem.jpg,
    003 - Imp.jpg,
    004 - Morning Star.jpg,
    005 - Cortez Chip.jpg,
    006 - Peacock.jpg,
    007 - ZU.13 Key Master.jpg,
    008 - The Helpful AI.jpg,
    009 - Plascrete Carapace.jpg,
    010 - Haas-Bioroid - Stronger Together.jpg,
    011 - Mandatory Upgrades.jpg,
    012 - Janus 1.0.jpg,
    013 - Ash 2X3ZB9CY.jpg,
    014 - Braintrust.jpg,
    015 - Snowflake.jpg,
    016 - Restructured Datapool.jpg,
    017 - TMI.jpg,
    018 - Project Atlas.jpg,
    019 - Caduceus.jpg,
    020 - Draco.jpg",
  "Trace Amount" => 
    "021 - Vamp.jpg,
    022 - Liberated Accounts.jpg,
    023 - Satellite Uplink.jpg,
    024 - E3 Feedback Implants.jpg,
    025 - Compromised Employee.jpg,
    026 - Notoriety.jpg,
    027 - Snowball.jpg,
    028 - Dyson Mem Chip.jpg,
    029 - Encryption Protocol.jpg,
    030 - Sherlock 1.0.jpg,
    031 - Jinteki - Replicating Perfection.jpg,
    032 - Fetal AI.jpg,
    033 - Trick of Light.jpg,
    034 - Sensei.jpg,
    035 - Big Brother.jpg,
    036 - ChiLo City Grid.jpg,
    037 - Power Grid Overload.jpg,
    038 - Amazon Industrial Zone.jpg,
    039 - Executive Retreat.jpg,
    040 - Freelancer.jpg",
  "Cyber Exodus" =>
    "041 - Nerve Agent.jpg,
    042 - Joshua B.jpg,
    043 - Emergency Shutdown.jpg,
    044 - Muresh Bodysuit.jpg,
    045 - Snitch.jpg,
    046 - Chaos Theory - Wunderkind.jpg,
    047 - Test Run.jpg,
    048 - Dinosaurus.jpg,
    049 - Personal Workshop.jpg,
    050 - Public Sympathy.jpg,
    051 - Project Vitruvius.jpg,
    052 - Viper.jpg,
    053 - Edge of World.jpg,
    054 - Sunset.jpg,
    055 - Marked Accounts.jpg,
    056 - Pop-Up Window.jpg,
    057 - Woodcutter.jpg,
    058 - Commercialization.jpg,
    059 - Private Contracts.jpg,
    060 - Chimera.jpg",
  "A Study in Static" => 
    "061 - Disrupter.jpg,
    062 - Force of Nature.jpg,
    063 - Scrubber.jpg,
    064 - Doppelganger.jpg,
    065 - Crescentus.jpg,
    066 - Deus X.jpg,
    067 - All-Nighter.jpg,
    068 - Inside Man.jpg,
    069 - Underworld Contacts.jpg,
    070 - Green Level Clearance.jpg,
    071 - Hourglass.jpg,
    072 - Dedicated Server.jpg,
    073 - Bullfrog.jpg,
    074 - Uroboros.jpg,
    075 - Net Police.jpg,
    076 - Weyland Consortium - Because We Built It.jpg,
    077 - Government Contracts.jpg,
    078 - Tyrant.jpg,
    079 - Oversight AI.jpg,
    080 - False Lead.jpg",
  "Humanity_s Shadow" =>
    "081 - Surge.jpg,
    082 - Xanadu.jpg,
    083 - Andromeda - Dispossessed Ristie.jpg,
    084 - Networking.jpg,
    085 - HQ Interface.jpg,
    086 - Pheremones.jpg,
    087 - Quality Time.jpg,
    088 - Replicator.jpg,
    089 - Creeper.jpg,
    090 - Kraken.jpg,
    091 - Kati Jones.jpg,
    092 - Eve Campaign.jpg,
    093 - Rework.jpg,
    094 - Whirlpool.jpg,
    095 - Hokusai Grid.jpg,
    096 - Data Hound.jpg,
    097 - Bernice Mai.jpg,
    098 - Salvage.jpg,
    099 - Simone Diego.jpg,
    100 - Foxfire.jpg",
  "Future Proof" => 
    "101 - Retrieval Run.jpg,
    102 - Darwin.jpg,
    103 - Data Leak Reversal.jpg,
    104 - Faerie.jpg,
    105 - Mr. Li.jpg,
    106 - Indexing.jpg,
    107 - R_D Interface.jpg,
    108 - Deep Thought.jpg,
    109 - New Angeles City Hall.jpg,
    110 - Eli 1.0.jpg,
    111 - Ruhr Valley.jpg,
    112 - Ronin.jpg,
    113 - Midori.jpg,
    114 - NBN - The World is Yours.jpg,
    115 - Project Beale.jpg,
    116 - Midseason Replacements.jpg,
    117 - Flare.jpg,
    118 - Dedicated Response Team.jpg,
    119 - Burke Bugs.jpg,
    120 - Corporate War.jpg",
  "Opening Moves" => 
    "001 - Frame Job.jpg, 002 - Pawn.jpg, 003 - Rook.jpg, 004 - Hostage.jpg, 005 - Gorman Drip v1.jpg, 006 - Lockpick.jpg, 007 - False Echo.jpg, 008 - Motivation.jpg, 009 - John Masanori.jpg,
    010 - Project Ares.jpg, 011 - NEXT Bronze.jpg, 012 - Celebrity Gift.jpg, 013 - Himitsu-Bako.jpg, 014 - Character Assassination.jpg, 015 - Jackson Howard.jpg, 016 - Invasion of Privacy.jpg,
    017 - Geothermal Fracking.jpg, 018 - Swarm.jpg, 019 - Cyberdex Trial.jpg, 020 - Grim.jpg",
  "Second Thoughts" => 
    "021 - Bishop.jpg, 022 - Scheherazade.jpg, 023 - Hard at Work.jpg, 024 - Recon.jpg, 025 - CopyCat.jpg, 026 - Leviathan.jpg, 027 - Eureka!.jpg, 028 - Record Reconstructor.jpg, 029 - PrePaid VoicePad.jpg,
    030 - Wotan.jpg, 031 - Hellion Alpha Test.jpg, 032 - Clone Retirement.jpg, 033 - Swordsman.jpg, 034 - Shipment from SanSan.jpg, 035 - Muckraker.jpg, 036 - The Cleaners.jpg, 037 - Elizabeth Mills.jpg,
    038 - Off the Grid.jpg, 039 - Profiteering.jpg, 040 - Restructure.jpg",
  "Mala Tempora" => 
    "041 - Reina Roja - Freedom Fighter.jpg, 042 - Deep Red.jpg, 043 - Knight.jpg, 044 - Running Interference.jpg, 045 - Expert Schedule Analyzer.jpg, 046 - Grifter.jpg, 047 - Torch.jpg,
    048 - Woman in the Red Dress.jpg, 049 - Raymond Flint.jpg, 050 - Isabel McGuire.jpg, 051 - Hudson 1.0.jpg, 052 - Accelerated Diagnostics.jpg, 053 - Unorthodox Predictions.jpg, 054 - Sundew.jpg,
    055 - City Surveillance.jpg, 056 - Snoop.jpg, 057 - Ireress.jpg, 058 - Power Shutdown.jpg, 059 - Paper Wall.jpg, 060 - Interns.jpg",
  "True Colors" =>
    "061 - Keyhole.jpg, 062 - Activist Support.jpg, 063 - Lawyer Up.jpg, 064 - Leverage.jpg, 065 - Garrote.jpg, 066 - LLDS Processor.jpg, 067 - Sharpshooter.jpg, 068 - Capstone.jpg,
    069 - Starlight Crusade Funding.jpg, 070 - Rex Campaign.jpg, 071 - Fenris.jpg, 072 - Panic Button.jpg, 073 - Shock!.jpg, 074 - Tsurugi.jpg, 075 - TGTBT.jpg, 076 - Sweeps Week.jpg, 077 - RSVP.jpg,
    078 - Curtain Wall.jpg, 079 - Punitive Counterstrike.jpg, 080 - Veterans Program.jpg",
  "Fear and Loathing" =>
    "081 - Quest Completed.jpg, 082 - Hemmhorhage.jpg, 083 - Tallie Perrault.jpg, 084 - Executive Wiretaps.jpg, 085 - Blackguard.jpg, 086 - CyberSolutions Mem Chip.jpg, 087 - Alpha.jpg, 088 - Omega.jpg,
    089 - Blackmail.jpg, 090 - Blue Level Clearance.jpg, 091 - Strongbox.jpg, 092 - Toshiyuki Sakai.jpg, 093 - Yagura.jpg, 094 - Restoring Face.jpg, 095 - Market Research.jpg, 096 - Wraparound.jpg,
    097 - GRNDL - Power Unleashed.jpg, 098 - Vulcan Coverup.jpg, 099 - GRNDL Refinery.jpg, 100 - Subliminal Messaging.jpg",
  "Double Time" =>
    "101 - Singularity.jpg, 102 - Queen_s Gambit.jpg, 103 - Dyson Fractal Generator.jpg, 104 - Silencer.jpg, 105 - Savoir-Faire.jpg, 106 - Fall Guy.jpg, 107 - Power Nap.jpg, 108 - Paintbrush.jpg,
    109 - Lucky Find.jpg, 110 - Gyri Labyrinth.jpg, 111 - Reclamation Order.jpg, 112 - Broadcast Square.jpg, 113 - Corporate Shuffle.jpg, 114 - Caprice Nisei.jpg, 115 - Shinobi.jpg, 116 - Marker.jpg,
    117 - Hive.jpg, 118 - Witness Tampering.jpg, 119 - NAPD Contract.jpg, 120 - Quandary.jpg",
  "Upstalk" =>
    "001 - Domestic Sleepers.jpg, 002 - NEXT Silver.jpg, 003 - Lotus Field.jpg, 004 - Mutate.jpg, 005 - Near-Earth Hub - Broadcast Center.jpg, 006 - Primary Transmission Dish.jpg,
    007 - Midway Station Grid.jpg, 008 - The Root.jpg, 009 - Taurus.jpg, 010 - Mother Goddess.jpg, 011 - Galahad.jpg, 012 - Bad Times.jpg, 013 - Cyber Threat.jpg, 014 - Lamprey.jpg,
    015 - Paper Tripping.jpg, 016 - Power Tap.jpg, 017 - Nasir Meidan - Cyber Explorer.jpg, 018 - Social Engineering.jpg, 019 - Leprechaun.jpg, 020 - Eden Shard.jpg",
  "The Spaces Between" =>
    "021 - The Foundry - Refining the Process.jpg, 022 - Enhanced Login Protocol.jpg, 023 - Heinlein Grid.jpg, 024 - Encrypted Portals.jpg, 025 - Cerebral Static.jpg, 026 - Targeted Marketing.jpg,
    027 - Information Overload.jpg, 028 - Paywall Implementation.jpg, 029 - Sealed Vault.jpg, 030 - Eden Fragment.jpg, 031 - Lag Time.jpg, 032 - Will-O_-the-Wisp.jpg, 033 - D4v1d.jpg, 034 - Scrubbed.jpg,
    035 - Three Steps Ahead.jpg, 036 - Unscheduled Maintenance.jpg, 037 - Cache.jpg, 038 - Net Celebrity.jpg, 039 - LLDS Energy Regulator.jpg, 040 - Ghost Runner.jpg",
  "First Contact" =>
    "041 - IQ.jpg, 042 - Eliza_s Toybox.jpg, 043 - Kitsune.jpg, 044 - Port Anson Grid.jpg, 045 - The News Now Hour.jpg, 046 - Manhunt.jpg, 047 - Wendigo.jpg, 048 - Crisium Grid.jpg,
    049 - Chronos Project.jpg, 050 - Shattered Remains.jpg, 051 - Lancelot.jpg, 052 - Quetzal - Free Spirit.jpg, 053 - BlacKat.jpg, 054 - Duggar_s.jpg, 055 - Box-E.jpg, 056 - The Supplier.jpg,
    057 - Refractor.jpg, 058 - Order of Sol.jpg, 059 - Hades Shard.jpg, 060 - Rachel Beckman.jpg",
  "Up and Over" =>
    "061 - Architect.jpg, 062 - Peak Efficiency.jpg, 063 - Labyrinthine Servers.jpg, 064 - Ashigaru.jpg, 065 - Mamba.jpg, 066 - Reversed Accounts.jpg, 067 - Universal Connectivity Fee.jpg,
    068 - Blue Sun - Powering the Future.jpg, 069 - Changeling.jpg, 070 - Reuse.jpg, 071 - Hades Fragment.jpg, 072 - Docklands Crackdown.jpg, 073 - Inject.jpg, 074 - Origami.jpg, 075 - Fester.jpg,
    076 - Autoscripter.jpg, 077 - Switchblade.jpg, 078 - Trade-In.jpg, 079 - Astrolabe.jpg, 080 - Angel Arena.jpg",
  "All That Remains" =>
    "081 - Bifrost Array.jpg, 082 - Saggitarius.jpg, 083 - Hostile Infrastructure.jpg, 084 - Gemini.jpg, 085 - License Acquisition.jpg, 086 - Daily Business Show.jpg, 087 - Superior Cyberwalls.jpg,
    088 - Executive Boot Camp.jpg, 089 - Lycan.jpg, 090 - Snatch and Grab.jpg, 091 - Merlin.jpg, 092 - Shell Corporation.jpg, 093 - Ekomind.jpg, 094 - Cerberus Cuj.0 H3.jpg,
    095 - Leela Patel - Trained Pragmatist.jpg, 096 - Cerberus Rex H2.jpg, 097 - Zona Sul Shipping.jpg, 098 - Cybsoft MacroDrive.jpg, 099 - Cerberus Lady H1.jpg, 100 - Utopia Shard.jpg",
  "The Source" =>
    "101 - Helum-3 Deposit.jpg, 102 - Errand Boy.jpg, 103 - IT Department.jpg, 104 - Markus 1.0.jpg, 105 - Industrial Genomics - Growing Solutions.jpg, 106 - Turtlebacks.jpg, 107 - Shoot the Moon.jpg,
    108 - Troll.jpg, 109 - Virgo.jpg, 110 - Utopia Fragment.jpg, 111 - Excalibur.jpg, 112 - Self-Destruct.jpg, 113 - Incubator.jpg, 114 - Ixodidae.jpg, 115 - Code Siphon.jpg,
    116 - Collective Consciousness.jpg, 117 - Sage.jpg, 118 - Bribery.jpg, 119 - Au Revoir.jpg, 120 - Earthrise Hotel.jpg",
  "The Valley" =>
    "001 - Clot.jpg, 002 - Paige Piper.jpg, 003 - Adjusted Chronotype.jpg, 004 - Spike.jpg, 005 - Enhanced Vision.jpg, 006 - Gene Conditioning Shoppe.jpg, 007 - Synthetic Blood.jpg, 008 - Traffic Jam.jpg,
    009 - Symmetrical Visage.jpg, 010 - Brain-Taping Warehouse.jpg, 011 - NEXT Gold.jpg, 012a - Jinteki Biotech.jpg, 012b - The Tank.jpg, 012c - The Greenhouse.jpg, 012d - The Brewery.jpg,
    013 - Genetic Resequencing.jpg, 014 - Cortex Lock.jpg, 015 - Valley Grid.jpg, 016 - Bandwidth.jpg, 017 - Predictive Algorithm.jpg, 018 - Capital Investors.jpg, 019 - Negotiator.jpg,
    020 - Tech Startup.jpg",
  "Breaker Bay" =>
    "021 - Hacktivist Meeting.jpg, 022 - Off-Campus Apartment.jpg, 023 - Career Fair.jpg, 024 - Dorm Computer.jpg, 025 - Hayley Kaplan - Universal Scholar.jpg, 026 - Game Day.jpg, 027 - Comet.jpg,
    028 - Study Guide.jpg, 029 - London Library.jpg, 030 - Tyson Observatory.jpg, 031 - Beach Party.jpg, 032 - Research Grant.jpg, 033 - Turing.jpg, 034 - Crick.jpg, 035 - Recruiting Trip.jpg,
    036 - Blacklist.jpg, 037 - Gutenberg.jpg, 038 - Student Loans.jpg, 039 - Meru Mati.jpg, 040 - Breaker Bay Grid.jpg",
  "Chrome City" =>
    "041 - Immolation Script.jpg, 042 - Skulljack.jpg, 043 - Turntable.jpg, 044 - Chrome Parlor.jpg, 045 - Titanium Ribs.jpg, 046 - Crowbar.jpg, 047 - Net-Ready Eyes.jpg, 048 - Analog Dreamers.jpg,
    049 - Brain Cage.jpg, 050 - Cybernetics Division - Humanity Upgraded.jpg, 051 - Self-Destruct Chips.jpg, 052 - Lab Dog.jpg, 053 - Oaktown Grid.jpg, 054 - Ryon Knight.jpg, 055 - Claivoyant Monitor.jpg,
    056 - Lockdown.jpg, 057 - Little Engine.jpg, 058 - Oaktown Renovation.jpg, 059 - Corporate Town.jpg, 060 - Quicksand.jpg",
  "The Underway" =>
    "061 - Faust.jpg, 062 - Street Peddler.jpg, 063 - Armand Geist Walker - Tech Lord.jpg, 064 - Drive By.jpg, 065 - Forger.jpg, 066 - Shiv.jpg, 067 - Gang Sign.jpg, 068 - Muertos Gang Member.jpg,
    069 - Chameleon.jpg, 070 - Hyperdriver.jpg, 071 - Test Ground.jpg, 072 - Defective Brainchips.jpg, 073 - Allele Repression.jpg, 074 - Marcus Batty.jpg, 075 - Expose.jpg, 076 - Pachinko.jpg,
    077 - Underway Renovation.jpg, 078 - Contract Killer.jpg, 079 - Spiderweb.jpg, 080 - Underway Grid.jpg",
  "Old Hollywood" =>
    "081 - Trope.jpg, 082 - Spoilers.jpg, 083 - Drug Dealer.jpg, 084 - Rolodex.jpg, 085 - Fan Site.jpg, 086 - Film Critic.jpg, 087 - Paparazzi.jpg, 088 - Ronald Five.jpg, 089 - Enforcer 1.0.jpg,
    090 - It_s A Trap!.jpg, 091 - An Offer You Can_t Refuse.jpg, 092 - Haarpsichord Studios - Entertainment Unleased.jpg, 093 - Award Bait.jpg, 094 - Explode-A-Palooza.jpg, 095 - Early Premiere.jpg,
    096 - Casting Call.jpg, 097 - Old Hollywood Grid.jpg, 098 - Hollywood Renovation.jpg, 099 - Back Channels.jpg, 100 - Vanity Project.jpg",
  "The Universe of Tomorrow" =>
    "101 - Power to the People.jpg, 102 - Surfer.jpg, 103 - DDoS.jpg, 104 - Laramy Fisk - Savvy Investor.jpg, 105 - Fisk Investment Seminar.jpg, 106 - Bookmark.jpg, 107 - DaVinci.jpg,
    108 - Wireless Net Pavilion.jpg, 109 - Cybernetics Court.jpg, 110 - Team Sponsorship.jpg, 111 - Chronos Protocol.jpg, 112 - Ancestral Imager.jpg, 113 - Genetics Pavilion.jpg, 114 - Franchise City.jpg,
    115 - Product Placement.jpg, 116 - Worlds Plaza.jpg, 117 - Public Support.jpg, 118 - Tour Guide.jpg, 119 - Expo Grid.jpg, 120 - The Future Is Now.jpg",
  "Kala Ghoda" =>
    "001 - Run Amok.jpg, 002 - Ramujan-Reliant 550 BMI.jpg, 003 - Street Magic.jpg, 004 - High-Stakes Job.jpg, 005 - Mongoose.jpg, 006 - Jesminder Sareen.jpg, 007 - Maya.jpg, 008 - Panchatantra.jpg,
    009 - Artist Colony.jpg, 010 - Chatterjee University.jpg, 011 - Advanced Concept Hopper.jpg, 012 - Vikram 1.0.jpg, 013 - Heritage Committee.jpg, 014 - Mumbad City Grid.jpg, 015 - Kala Ghoda Real TV.jpg,
    016 - Interrupt 0.jpg, 017 - Dedication Ceremony.jpg, 018 - Mumba Temple.jpg, 019 - Museum of History.jpg",
  "Business First" =>
    "020 - EMP Device.jpg, 021 - Diwan.jpg, 022 - CBI Raid.jpg, 023 - Tech Trader.jpg, 024 - NetChip.jpg, 025 - Corporate Scandal.jpg, 026 - Populist Rally.jpg, 027 - Advanced Assembly Lines.jpg,
    028 - Lakshmi Smartfabrics.jpg, 029 - Product Recall.jpg, 030 - Palana Foods.jpg, 031 - Palana Agroplex.jpg, 032 - Harvester.jpg, 033 - Remote Data Farm.jpg, 034 - Disposable HQ.jpg,
    035 - New Construction.jpg, 036 - Mumbad Construction Co.jpg, 037 - Corporate Sales Team.jpg, 038 - PAD Factory.jpg",
  "Democracy and Dogma" =>
    "039 - Political Graffiti.jpg, 040 - Nero Severn.jpg, 041 - Reflection.jpg, 042 - Spy Camera.jpg, 043 - Political Operative.jpg, 044 - Sadyojata.jpg, 045 - Freedom Through Equality.jpg,
    046 - Akshara Sareen.jpg, 047 - Councilman.jpg, 048 - Voting Machine Initiative.jpg, 049 - Clone Suffrage Movement.jpg, 050 - Bio-Ethics Association.jpg, 051 - Political Dealings.jpg,
    052 - Clones Are Not People.jpg, 053 - Sensie Actors Union.jpg, 054 - Commercial Bankers Group.jpg, 055 - Mumbad City Hall.jpg, 056 - Bailiff.jpg, 057 - Surat City Grid.jpg",
  "Salsette Island" =>
    "058 - Making an Entrance.jpg, 059 - Salsette Slums.jpg, 060 - Exclusive Party.jpg, 061 - Vamadeva.jpg, 062 - Brahman.jpg, 063 - Patron.jpg, 064 - Sports Hopper.jpg, 065 - Bazaar.jpg,
    066 - Personality Profiles.jpg, 067 - Jeeves Model Bioroids.jpg, 068 - Raman Rai.jpg, 069 - Upayoga.jpg, 070 - Aryabhata Tech.jpg, 071 - Salem_s Hospitality.jpg, 072 - Executive Search Firm.jpg,
    073 - Indian Union Stock Exchange.jpg, 074 - Cobra.jpg, 075 - Localized Product Line.jpg, 076 - Mumbad Virtaul Tour.jpg",
  "The Liberated Mind" =>
    "077 - The Noble Path.jpg, 078 - Emptied Mind.jpg, 079 - Information Sifting.jpg, 080 - Out of the Ashes.jpg, 081 - Liberated Chela.jpg, 082 - Temple of the Liberated Mind.jpg, 083 - Rebirth.jpg,
    084 - Guru Davinder.jpg, 085 - The Turning Wheel.jpg, 086 - Brainstorm.jpg, 087 - Ravana 1.0.jpg, 088 - Dedicated Neural Net.jpg, 089 - Chetana.jpg, 090 - Puppet Master.jpg, 091 - Waiver.jpg,
    092 - Exchange of Information.jpg, 093 - Red Tape.jpg, 094 - Consulting Visit.jpg, 095 - Vanilla.jpg",
  "Fear the Masses" =>
    "096 - Fear the Masses.jpg, 097 - Aghora.jpg, 098 - Bhagat.jpg, 099 - The Black File.jpg, 100 - The Price of Freedom.jpg, 101 - Ankusa.jpg, 102 - Rigged Results.jpg, 103 - Magnet.jpg,
    104 - Lateral Growth.jpg, 105 - Improved Protein Source.jpg, 106 - Voter Intimidation.jpg, 107 - Harishchandra Ent.jpg, 108 - Full Immersion RecStudio.jpg, 109 - Ibrahim Salem.jpg,
    110 - Navi Mumbai City Grid.jpg, 111 - Zealous Judge.jpg, 112 - Election Day.jpg, 113 - Subcontract.jpg, 114 - Merger.jpg",
  "23 Seconds" =>
    "001 - System Outage.jpg, 002 - Null - Whistleblower.jpg, 003 - GPI Net Tap.jpg, 004 - Hernando Cortez.jpg, 005 - Dai V.jpg, 005 - MIrror.jpg, 007 - Another Day Another Paycheck.jpg,
    008 - Deuces Wild.jpg, 009 - Injection Attack.jpg, 010 - Fairchild 1.0.jpg, 011 - Sherlock 2.0.jpg, 012 - Hyoubu Research Facility.jpg, 013 - Chrysalis.jpg, 014 - Georgia Emelyov.jpg,
    015 - Watchdog.jpg, 016 - Hard-Hitting News.jpg, 017 - NBN - Controlling the Message.jpg, 018 - Crisis Management.jpg, 019 - Stock Buy-Back.jpg, 020 - Sandburg.jpg",
  "Blood Money" =>
    "021 - Credit Crash.jpg, 022 - Rumor Mill.jpg, 023 - Nfr.jpg, 024 - Paperclip.jpg, 025 - Golden.jpg, 026 - Temujin Contract.jpg, 027 - Khan - Savvy Skiptracer.jpg, 028 - Data Breach.jpg,
    029 - Algo Trading.jpg, 030 - Beth Kilrain-Chang.jpg, 031 - Fairchild 2.0.jpg, 032 - Aiki.jpg, 033 - Enforcing Loyalty.jpg, 034 - Hatchet Job.jpg, 035 - Special Report.jpg, 036 - C.I. Fund.jpg,
    037 - Liquidation.jpg, 038 - Weyland Consortium - Builder of Nations.jpg, 039 - Financial Collapse.jpg, 040 - Prisec.jpg",
  "Escalation" =>
    "041 - Obelus.jpg, 042 - Black Orchestra.jpg, 043 - Omar Keung - Conspiracy Theorist.jpg, 044 - Peregrine.jpg, 045 - Houdini.jpg, 046 - Net Mercur.jpg, 047 - Find the Truth.jpg,
    048 - First Responders.jpg, 049 - Fairchild 3.0.jpg, 050 - Ark Lockdown.jpg, 051 - Hellion Beta Test.jpg, 052 - Project Kusanagi.jpg, 053 - DNA Tracker.jpg, 054 - Jinteki - Potential Unleashed.jpg,
    055 - Alexa Belsky.jpg, 056 - Observe and Destroy.jpg, 057 - Service Outage.jpg, 058 - Boom!.jpg, 059 - Door to Door.jpg, 060 - Scarcity of Resources.jpg",
  "Intervention" =>
    "061 - En Passant.jpg, 062 - Frantic Coding.jpg, 063 - The Gauntlet.jpg, 064 - Saker.jpg, 065 - Blockade Runner.jpg, 066 - Ele Smoke Scovak - Cynosure of the Net.jpg, 067 - Top Hat.jpg,
    068 - Blackstone.jpg, 069 - Government Investigations.jpg, 070 - Citadel Sanctuary.jpg, 071 - Wetwork Refit.jpg, 072 - Haas-Bioroid - Architects of Tomorrow.jpg, 073 - Fumiko Yamamori.jpg,
    074 - Hasty Relocation.jpg, 075 - Data Ward.jpg, 076 - Drone Screen.jpg, 077 - Chief Slee.jpg, 078 - Bulwark.jpg, 079 - Best Defense.jpg, 080 - Preemptive Action.jpg",
  "Martial Law" =>
    "081 - MKUltra.jpg, 082 - On the Lam.jpg, 083 - Cold Read.jpg, 084 - Equivocation.jpg, 085 - Misdirection.jpg, 086 - Reaver.jpg, 087 - Interdiction.jpg, 088 - Baba Yaga.jpg, 089 - Fairchild.jpg,
    090 - Friends in High Places.jpg, 091 - Manta Grid.jpg, 092 - Mind Game.jpg, 093 - Nihongai Grid.jpg, 094 - IP Block.jpg, 095 - Thoth.jpg, 096 - Anson Rose.jpg, 097 - Mausolus.jpg, 098 - Sapper.jpg,
    099 - Show of Force.jpg, 100 - Enforced Curfew.jpg",
  "Quorum" =>
    "101 - Sifr.jpg, 102 - Sunya.jpg, 103 - Recon Drone.jpg, 104 - Tapwrm.jpg, 105 - Tracker.jpg, 106 - Aaron Marron.jpg, 107 - Encore.jpg, 108 - Fawkes.jpg, 109 - Peace in Our Time.jpg,
    110 - Sensor Net Activation.jpg, 111 - Violet Level Clearance.jpg, 112 - Chiyashi.jpg, 113 - Psychokinesis.jpg, 114 - Net Quarantine.jpg, 115 - Herald.jpg, 116 - Veritas.jpg, 117 - Brian Stinson.jpg,
    118 - NASX.jpg, 119 - Macrophage.jpg, 120 - Tribunal.jpg",
  "Daedalus Complex" =>
    "001 - Pushing the Envelope.jpg, 002 - Maw.jpg, 003 - The Archivist.jpg, 004 - Exploit.jpg, 005 - Spot the Prey.jpg, 006 - Bio-Modeled Network.jpg, 007 - Network Exchange.jpg, 008 - Mad Dash.jpg,
    009 - NEXT Wave 2.jpg, 010 - Zed 2.0.jpg, 011 - Defense Construct.jpg, 012 - Synth DNA Modification.jpg, 013 - Kakugo.jpg, 014 - Net Analytics.jpg, 015 - SYNC BRE.jpg,
    016 - Jemison Astronautics - Sacrifice. Audacity. Success.jpg, 017 - Quarantine System.jpg, 018 - Oberth Protocol.jpg, 019 - Khondi Plaza.jpg, 020 - Signal Jamming.jpg",
  "Station One" =>
    "021 - Severnius Stim Implant.jpg, 022 - Clan Vengeance.jpg, 023 - Counter Surveillance.jpg, 024 - Mobius.jpg, 025 - Los - Data Hijacker.jpg, 026 - System Seizure.jpg, 027 - Customized Secretary.jpg,
    028 - Build Script.jpg, 029 - Seidr Adaptive Barrier.jpg, 030 - Nerine 2.0.jpg, 031 - Load Testing.jpg, 032 - Bloom.jpg, 033 - Replanting.jpg, 034 - CPC Generator.jpg, 035 - Free Lunch.jpg,
    036 - MCA Informant.jpg, 037 - Clyde Van Rite.jpg, 038 - Watchtower.jpg, 039 - Sacrifice.jpg, 040 - Self-Adapting Code Wall.jpg",
  "Earth_s Scion" =>
    "041 - Berserker.jpg, 042 - Persephone.jpg, 043 - Rubicon Switch.jpg, 044 - Aenas Informant.jpg, 045 - Rosetta 2.0.jpg, 046 - Adjusted Matrix.jpg, 047 - Dedicated Processor.jpg, 048 - Inversificator.jpg,
    049 - Dadiana Chacon.jpg, 050 - NEXT Opal.jpg, 051 - Bioroid Work Crew.jpg, 052 - AgInfusion - New Miracles for a New World.jpg, 053 - Bamboo Dome.jpg, 054 - Ben Musashi.jpg, 055 - Authenticator.jpg,
    056 - Henry Phillips.jpg, 057 - Battlement.jpg, 058 - Audacity.jpg, 059 - Red Planet Couriers.jpg, 060 - Owl.jpg",
  "Blood and Water" =>
    "061 - Alice Merchant - Clan Agitator.jpg, 062 - Jarogniew Mercs.jpg, 063 - Maui.jpg, 064 - Bug Out Bag.jpg, 065 - Keros McIntyre.jpg, 066 - Daredevil.jpg, 067 - Mass-Driver.jpg,
    068 - Warroid Tracker.jpg, 069 - Loki.jpg, 070 - Obokata Protocol.jpg, 071 - Miraju.jpg, 072 - Shipment from Tennin.jpg, 073 - Escalate Vitriol.jpg, 074 - Reeducation.jpg, 075 - Traffic Analyzer.jpg,
    076 - Meteor Mining.jpg, 077 - Standoff.jpg, 078 - Success.jpg, 079 - Whampoa Reclamation.jpg, 080 - Mass Commercialization.jpg",
  "Free Mars" =>
    "081 - Mars for Martians.jpg, 082 - God of War.jpg, 083 - Leave No Trace.jpg, 084 - Rip Deal.jpg, 085 - Flashbang.jpg, 086 - Lean and Mean.jpg, 087 - Maven.jpg, 088 - Na_Not_k.jpg, 089 - Bloo Moose.jpg,
    090 - O2 Shortage.jpg, 091 - Helheim Servers.jpg, 092 - Mandatory Seed Replacement.jpg, 093 - Water Monopoly.jpg, 094 - Metamorph.jpg, 095 - Data Loop.jpg, 096 - Biased Reporting.jpg,
    097 - Open Forum.jpg, 098 - Tithonium.jpg, 099 - Transparency Initiative.jpg, 100 - Rover Algorithm.jpg",
  "Crimson Dust" =>
    "101 - Mining Accident.jpg, 102 - Respirocytes.jpg, 103 - Salvaged Vanadis Armory.jpg, 104 - Aumakua.jpg, 105 - Caldera.jpg, 106 - Diana_s Hunt.jpg, 107 - Reshape.jpg, 108 - Dummy Box.jpg,
    109 - Corporate Defector.jpg, 110 - CFC Excavation Contract.jpg, 111 - MCA Austerity Policy.jpg, 112 - Restore.jpg, 113 - Breached Dome.jpg, 114  - Sand Storm.jpg, 115 - AR-Enhanced Security.jpg,
    116 - Rolling Brownout.jpg, 117 - Threat Level Alpha.jpg, 118 - Priority Construction.jpg, 119 - Fractal Threat Matrix.jpg, 120 - Conundrum.jpg",
  "Sovereign Sight" =>
    "001 - By Any Means.jpg, 002 - Yusuf.jpg, 003 - Zamba.jpg, 004 - Puffer.jpg, 005 - Lewi Guilherme.jpg, 006 - Cyberdelia.jpg, 007 - Upya.jpg, 008 - Assimilator.jpg, 009 - Asa Group.jpg,
    010 - Ikawah Project.jpg, 011 - Najja 1.0.jpg, 012 - Gene Splicer.jpg, 013 - Mganga.jpg, 014 - Genotyping.jpg, 015 - Echo Chamber.jpg, 016 - Self-Growth Program.jpg, 017 - Calibration Testing.jpg,
    018 - Urban Renewal.jpg, 019 - Wake-up Call.jpg, 020 - Reconstruction Contract.jpg",
  "Down the White Nile" =>
    "021 - Acacia.jpg, 022 - Plague.jpg, 023 - Credit Kiting.jpg, 024 - Wari.jpg, 025 - Kabonesa Wu.jpg, 026 - Takobi.jpg, 027 - Kongamato.jpg, 028 - Emergent Creativity.jpg, 029 - RNG Key.jpg,
    030 - Nightdancer.jpg, 031 - Jinja City Grid.jpg, 032 - Aimor.jpg, 033 - Bacterial Programming.jpg, 034 - Jua.jpg, 035 - Threat Assessment.jpg, 036 - Economic Warfare.jpg, 037 - Forced Connection.jpg,
    038 - SSL Endorsement.jpg, 039 - NGO Front.jpg, 040 - Distract the Masses.jpg",
  "Council of the Crest" =>
    "041 - Exer.jpg, 042 - Friday Chip.jpg, 043 - Crypt.jpg, 044 - Corporate _Grant_.jpg, 045 - No One Home.jpg, 046 - Marathon.jpg, 047 - Gbahali.jpg, 048 - White Hat.jpg, 049 - Kuwinda K4H1U3.jpg,
    050 - NEXT Sapphire.jpg, 051 - Anansi.jpg, 052 - Code Replicator.jpg, 053 - Reverse Infection.jpg, 054 - Azmari EdTech.jpg, 055 - Degree Mill.jpg, 056 - Personalized Portal.jpg,
    057 - Armed Intimidation.jpg, 058 - Death and Taxes.jpg, 059 - Trojan Horse.jpg, 060 - TechnoCo.jpg",
  "The Devil and the Dragon" =>
    "061 - Glut Cipher.jpg, 062 - Knobkierie.jpg, 063 - 419 - Amoral Scammer.jpg, 064 - Falsified Credentials.jpg, 065 - Rogue Trading.jpg, 066 - Because I Can.jpg, 067 - Nyashia.jpg, 068 - Consume.jpg,
    069 - Malia Z0L0K4.jpg, 070 - Kill Switch.jpg, 071 - Tempus.jpg, 072 - Bio Vault.jpg, 073 - Sadaka.jpg, 074 - Endless EULA.jpg, 075 - Sandman.jpg, 076 - Amani Senai.jpg,
    077 - SSO Industries - Fueling Innovation.jpg, 078 - City Works Project.jpg, 079 - Oduduwa.jpg, 080 - Rashida Jaheem.jpg",
  "Whispers in Nalubaale" =>
    "081 - Freedom Khumalo.jpg, 082 - Trypano.jpg, 083 - Contaminate.jpg, 084 - Embezzle.jpg, 085 - Slipstream.jpg, 086 - Laamb.jpg, 087 - Gebrselassie.jpg, 088 - Compile.jpg, 089 - Logic Bomb.jpg,
    090 - Jackpot.jpg, 091 - Remote Enforcement.jpg, 092 - Kamali 1.0.jpg, 093 - Warden Fatuma.jpg, 094 - Viral Weaponization.jpg, 095 - Envelope.jpg, 096 - Mwanza City Grid.jpg,
    097 - Standard Procedure.jpg, 098 - Intake.jpg, 099 - Masvingo.jpg, 100 - Overseer Matrix.jpg",
  "Kampala Ascendent" =>
    "101 - Zer0.jpg, 102 - Musaazi.jpg, 103 - Hippo.jpg, 104 - Amina.jpg, 105 - Diversion of Funds.jpg, 106 - PAD Tap.jpg, 107 - Reclaim.jpg, 108 - Engolo.jpg, 109 - Flame-out.jpg, 110 - Black Hat.jpg,
    111 - Kasi String.jpg, 112 - NEXT Diamond.jpg, 113 - Riot Suppression.jpg, 114 - Mti Mwekundu.jpg, 115 - Mlinzi.jpg, 116 - Better Citizen Program.jpg, 117 - Market Forces.jpg, 118 - Surveyor.jpg,
    119 - High-Profile Target.jpg, 120 - False Flag.jpg"
}

cards.each do |pack_name, data|
  pack = Pack.where(name: pack_name).take
  data.scan(/\d+.*?\.jpg,?/).each do |card|
    puts "Card: #{card}"
    c = card.match(/(?<order>\d+[a-z]?)\s+-\s+(?<name>.*)\.jpg/).named_captures
    x = Card.create(order: c["order"].strip, name: c["name"].strip, pack: pack)
  end
end

box_cards = {
  "Core" =>
    "001 - Noise - Hacker Extraordinaire.jpg, 002 - Deja Vu.jpg, 003 - Demolition Run.jpg, 004 - Stimhack.jpg, 005 - Cyberfeeder.jpg, 006 - Grimoire.jpg, 007 - Corroder.jpg, 008 - Datasucker.jpg,
    009 - Djinn.jpg, 010 - Medium.jpg, 011 - Mimic.jpg, 012 - Parasite.jpg, 013 - Wyrm.jpg, 014 - Yog.0.jpg, 015 - Ice Carver.jpg, 016 - Wyldside.jpg, 017 - Gabriel Santiago.jpg, 018 - Account Siphon.jpg,
    019 - Easy Mark.jpg, 020 - Forged Activation Orders.jpg, 021 - Inside Job.jpg, 022 - Special Order.jpg, 023 - Lemuria Codecracker.jpg, 024 - Desperado.jpg, 025 - Aurora.jpg, 026 - Femme Fatale.jpg,
    027 - Ninja.jpg, 028 - Sneakdoor Beta.jpg, 029 - Bank Job.jpg, 030 - Crash Space.jpg, 031 - Data Dealer.jpg, 032 - Decoy.jpg, 033 - Kate Mac McCaffrey.jpg, 034 - Diesel.jpg, 035 - Modded.jpg,
    036 - The Maker_s Eye.jpg, 037 - Tinkering.jpg, 038 - Akamatsu Mem Chip.jpg, 039 - Rabbit Hole.jpg, 040 - The Personal Touch.jpg, 041 - The Toolbox.jpg, 042 - Battering Ram.jpg, 043 - Gordian Blade.jpg,
    044 - Magnum Opus.jpg, 045 - Net Shield.jpg, 046 - Pipeline.jpg, 047 - Aesop_s Pawnshop.jpg, 048 - Sacrificial Construct.jpg, 049 - Infiltration.jpg, 050 - Sure Gamble.jpg, 051 - Crypsis.jpg,
    052 - Access to Globalsec.jpg, 053 - Armitage Codebusting.jpg, 054 - Haas-Bioroid - Engineering the Future.jpg, 055 - Accelerated Beta Test.jpg, 056 - Adonis Campaign.jpg,
    057 - Aggressive Secretary.jpg, 058 - Archived Memories.jpg, 059 - Biotic Labor.jpg, 060 - Shipment from MirrorMorph.jpg, 061 - Heimdall 1.0.jpg, 062 - Ichi 1.0.jpg, 063 - Viktor 1.0.jpg,
    064 - Rototurret.jpg, 065 - Corporate Troubleshooter.jpg, 066 - Experiental Data.jpg, 067 - Jinteki - Personal Evolution.jpg, 068 - Nisei Mark II.jpg, 069 - Project Junebug.jpg, 070 - Snare!.jpg,
    071 - Zaibatsu Loyalty.jpg, 072 - Neural EMP.jpg, 073 - Precognition.jpg, 074 - Cell Portal.jpg, 075 - Chum.jpg, 076 - Data Mine.jpg, 077 - Neural Katana.jpg, 078 - Wall of Thorns.jpg,
    079 - Akitaro Watanabe.jpg, 080 - NBN - Making News.jpg, 081 - AstroScript Pilot Program.jpg, 082 - Breaking News.jpg, 083 - Anonymous Tip.jpg, 084 - Closed Accounts.jpg, 085 - Psychographics.jpg,
    086 - Sea Source.jpg, 087 - Ghost Branch.jpg, 088 - Data Raven.jpg, 089 - Matrix Analyzer.jpg, 090 - Tollbooth.jpg, 091 - Red Herrings.jpg, 092 - SanSan City Grid.jpg,
    093 - Weyland Consortium - Building a Better World.jpg, 094 - Hostile Takeover.jpg, 095 - Posted Bounty.jpg, 096 - Security Subcontract.jpg, 097 - Aggressive Negotiation.jpg,
    098 - Beanstalk Royalties.jpg, 099 - Scorched Earth.jpg, 100 - Shipment from Kaguya.jpg, 101 - Archer.jpg, 102 - Hadrian_s Wall.jpg, 103 - Ice Wall.jpg, 104 - Shadow.jpg, 105 - Research Station.jpg,
    106 - Priority Requisition.jpg, 107 - Private Security Force.jpg, 108 - Melange Mining Corp.jpg, 109 - PAD Campaign.jpg, 110 - Hedge Fund.jpg, 111 - Enigma.jpg, 112 - Hunter.jpg,
    113 - Wall of Static.jpg",
  "Creation and Control" =>
    "001 - Cerebral Imaging - Infinite Frontiers.jpg, 002 - Custom Biotics - Engineered for Success.jpg, 003 - NEXT Design - Guarding the Net.jpg, 004 - Director Haas_ Pet Project.jpg,
    005 - Efficiency Committee.jpg, 006 - Project Wotan.jpg, 007 - Sentinel Defense Program.jpg, 008 - Alix T4LB07.jpg, 009 - Cerebral Overwriter.jpg, 010 - Director Haas.jpg, 011 - Haas Arcology AI.jpg,
    012 - Thomas Haas.jpg, 013 - Bioroid Efficiency Research.jpg, 014 - Successful Demonstration.jpg, 015 - Heimdall 2.0.jpg, 016 - Howler.jpg, 017 - Ichi 2.0.jpg, 018 - Minelayer.jpg, 019 - Viktor 2.0.jpg,
    020 - Zed 1.0.jpg, 021 - Awakening Center.jpg, 022 - Tyr_s Hand.jpg, 023 - Gila Hands Arcology.jpg, 024 - Levy University.jpg, 025 - Server Diagnostics.jpg, 026 - Bastion.jpg, 027 - Datapike.jpg,
    028 - Rielle Kit Peddler - Transhuman.jpg, 029 - The Professor - Keeper of Knowledge.jpg, 030 - Exile - Streethawk.jpg, 031 - Escher.jpg, 032 - Exploratory Romp.jpg, 033 - Freelance Coding Contract.jpg,
    034 - Scavenge.jpg, 035 - Levy AR Lab Access.jpg, 036 - Monolith.jpg, 037 - Feedback Filter.jpg, 038 - Clone Chip.jpg, 039 - Omni-Drive.jpg, 040 - Atman.jpg, 041 - Cloak.jpg, 042 - Dagger.jpg,
    043 - Chakana.jpg, 044 - Cyber-Cypher.jpg, 045 - Paricia.jpg, 046 - Self-Modifying Code.jpg, 047 - Sahasrara.jpg, 048 - Inti.jpg, 049 - Professional Contacts.jpg, 050 - Borrowed Satellite.jpg,
    051 - ICE Analyzer.jpg, 052 - Dirty Laundry.jpg, 053 - Daily Casts.jpg, 054 - Same Old Thing.jpg, 055 - The Source.jpg",
  "Honor and Profit" =>
    "001 - Harmony Medtech - Biomedical Pioneer.jpg, 002 - Nisei Division - The Next Generation.jpg, 003 - Tennin Institute - The Secrets Within.jpg, 004 - House of Knives.jpg,
    005 - Medical Breakthrough.jpg, 006 - Philotic Entanglement.jpg, 007 - The Future Perfect.jpg, 008 - Chairman Hiro.jpg, 009 - Mental Health Clinic.jpg, 010 - Psychic Field.jpg, 011 - Shi.Kyu.jpg,
    012 - Tenma Line.jpg, 013 - Cerebral Cast.jpg, 014 - Medical Research Fundraiser.jpg, 015 - Mushin No Shin.jpg, 016 - Inazuma.jpg, 017 - Komainu.jpg, 018 - Pup.jpg, 019 - Shiro.jpg,
    020 - Susanoo-No-Mikoto.jpg, 021 - NeoTokyo Grid.jpg, 022 - Tori Hanzo.jpg, 023 - Plan B.jpg, 024 - Guard.jpg, 025 - Rainbow.jpg, 026 - Diversified Portfolio.jpg, 027 - Fast Track.jpg,
    028 - Iain Sterling - Retired Spook.jpg, 029 - Ken Express Tenma - Escaped Clone.jpg, 030 - Silhouette - Stealth Operative.jpg, 031 - Calling in Favors.jpg, 032 - Early Bird.jpg,
    033 - Express Delivery.jpg, 034 - Feint.jpg, 035 - Legwork.jpg, 036 - Planned Assault.jpg, 037 - Logos.jpg, 038 - Public Terminal.jpg, 039 - Unregistered S_W _35.jpg, 040 - Window.jpg, 041 - Alias.jpg,
    042 - Breach.jpg, 043 - Bug.jpg, 044 - Gingerbread.jpg, 045 - Grappling Hook.jpg, 046 - Passport.jpg, 047 - Push Your Luck.jpg, 048 - Security Testing.jpg, 049 - Theophilius Bagbiter.jpg,
    050 - Tri-Maf Contact.jpg, 051 - Mass Install.jpg, 052 - Q-Coherence Chip.jpg, 053 - Overmind.jpg, 054 - Oracle May.jpg, 055 - Donut Taganes.jpg",
  "Order and Chaos" =>
    "001 - Argus Security - Protection Guaranteed.jpg, 002 - Gagarin Deep Space - Expanding The Horizon.jpg, 003 - Titan Transnational - Investing In Your Future.jpg, 004 - Firmware Updates.jpg,
    005 - Glenn Station.jpg, 006 - Government Takeover.jpg, 007 - High-Risk Investment.jpg, 008 - Constellation Protocol.jpg, 009 - Mark Yale.jpg, 010 - Space Camp.jpg, 011 - The Board.jpg,
    012 - Asteroid Belt.jpg, 013 - Wormhole.jpg, 014 - Nebula.jpg, 015 - Orion.jpg, 016 - Builder.jpg, 017 - Checkpoint.jpg, 018 - Fire Wall.jpg, 019 - Searchlight.jpg, 020 - Housekeeping.jpg,
    021 - Patch.jpg, 022 - Traffic Accident.jpg, 023 - Satellite Grid.jpg, 024 - The Twins.jpg, 025 - Sub Boost.jpg, 026 - Dedicated Technician Team.jpg, 027 - Cyberdex Virus Suite.jpg,
    028 - Edward Kim - Humanity_s Hammer.jpg, 029 - MaxX - Maximum Punk Rock.jpg, 030 - Valencia Estevez - The Angel of Cayambe.jpg, 031 - Amped Up.jpg, 032 - I_ve Had Worse.jpg,
    033 - Itinerant Protestors.jpg, 034 - Showing Off.jpg, 035 - Wanton Destruction.jpg, 036 - Day Job.jpg, 037 - Forked.jpg, 038 - Knifed.jpg, 039 - Spooned.jpg, 040 - Eater.jpg, 041 - Gravedigger.jpg,
    042 - Hivemind.jpg, 043 - Progenitor.jpg, 044 - Archives Interface.jpg, 045 - Chop Bot 3000.jpg, 046 - MemStrips.jpg, 047 - Vigil.jpg, 048 - Human First.jpg, 049 - Investigative Journalism.jpg,
    050 - Sacrificial Clone.jpg, 051 - Stim Dealer.jpg, 052 - Virus Breeding Ground.jpg, 053 - Uninstall.jpg, 054 - Qianju PT.jpg, 055 - Data Folding.jpg",
  "Data and Destiny" =>
    "001a - SYNC - Everything, Everywhere.jpg, 001b - SYNC - Everything, Everywhere.jpg, 002 - New Angeles Sol - Your News.jpg, 003 - Spark Agency - Worldwide Reach.jpg, 004 - 15 Minutes.jpg,
    005 - Improved Tracers.jpg, 006 - Rebranding Team.jpg, 007 - Quantum Predictive Model.jpg, 008 - Lily Lockwell.jpg, 009 - News Team.jpg, 010 - Shannon Claire.jpg, 011 - Victoria Jenkins.jpg,
    012 - Reality Threedee.jpg, 013 - Archangel.jpg, 014 - News Hound.jpg, 015 - Resistor.jpg, 016 - Special Offer.jpg, 017 - TL_DR.jpg, 018 - Turnpike.jpg, 019 - 24-7 News Cycle.jpg, 020 - Ad Blitz.jpg,
    021 - Media Blitz.jpg, 022 - The All-Seeing I.jpg, 023 - Surveillance Sweep.jpg, 024 - Keegan Lane.jpg, 025 - Rutherford Grid.jpg, 026 - Global Food Initiative.jpg, 027 - Launch Campaign.jpg,
    028 - Assassin.jpg, 029 - Apex - Invasive Predator.jpg, 030 - Apocalypse.jpg, 031 - Prey.jpg, 032 - Heartbeat.jpg, 033 - Endless Hunger.jpg, 034 - Harbinger.jpg, 035 - Hunting Grounds.jpg,
    036 - Wasteland.jpg, 037 - Adam - Compulsive Hacker.jpg, 038 - Independent Thinking.jpg, 039 - Brain Chip.jpg, 040 - Multithreader.jpg, 041 - Always Be Running.jpg, 042 - Dr. Lovegood.jpg,
    043 - Neutralize All Threats.jpg, 044 - Safety First.jpg, 045 - Sunny Lebeau - Security Specialist.jpg, 046 - Security Chip.jpg, 047 - Security Nexus.jpg, 048 - GS Striker M1.jpg,
    049 - GS Shrike M2.jpg, 050 - GS Sherman M3.jpg, 051 - Globalsec Security Clearance.jpg, 052 - Jak Sinclair.jpg, 053 - Employee Strike.jpg, 054 - Windfall.jpg, 055 - Technical Writer.jpg",
  "Terminal Directive" =>
    "001 - Steve Cambridge - Master Grifter.jpg, 002 - Brute-Force-Hack.jpg, 003 - Spear Phishing.jpg, 004 - SYN Attack.jpg, 005 - Polyhistor.jpg, 006 - Abagnale.jpg, 007 - Lustig.jpg, 008 - Demara.jpg,
    009 - Mammon.jpg, 010 - Charlatan.jpg, 011 - Maxwell James.jpg, 012 - Ayla BIOS Rahim - Simulant Specialist.jpg, 013 - Careful Planning.jpg, 014 - Deep Data Mining.jpg, 015 - LLDS Memory Diamond.jpg,
    016 - Ubax.jpg, 017 - Adept.jpg, 018 - Savant.jpg, 019 - Egret.jpg, 020 - Dhegdheer.jpg, 021 - Levy Advanced Research Lab.jpg, 022 - Laguna Velasco District.jpg, 023 - Process Automation.jpg,
    024 - Officer Frank.jpg, 025 - Dean Lister.jpg, 026 - Biometric Spoofing.jpg, 027 - The Shadow Net.jpg, 028 - Seidr Laboratories - Destiny Defined.jpg, 029 - Brain Rewiring.jpg,
    030 - Elective Upgrades.jpg, 031 - Successful Field Test.jpg, 032 - Estelle Moon.jpg, 033 - Marilyn Campaign.jpg, 034 - Eli 2.0.jpg, 035 - Executive Functioning.jpg, 036 - Holmegaard.jpg,
    037 - Tapestry.jpg, 038 - Ultraviolet Clearance.jpg, 039 - Black Level Clearance.jpg, 040 - Mason Bellamy.jpg, 041 - Skorpios Defensive Systems - Persuasive Power.jpg, 042 - Armored Servers.jpg,
    043 - Illicit Sales.jpg, 044 - Graft.jpg, 045 - Illegal Arms Factory.jpg, 046 - Mr. Stone.jpg, 047 - Bloodletter.jpg, 048 - Colossus.jpg, 049 - Hailstorm.jpg, 050 - Hortum.jpg, 051 - Hunter Seeker.jpg,
    052 - K.P. Lynn.jpg, 053 - Paper Trail.jpg, 054 - Honeyfarm.jpg, 055 - Long-Term Investment.jpg, 056 - Weir.jpg, 057 - IPO.jpg",
  "Revised Core" =>
    "001 - Reina Roja.jpg, 002 - Demolition Run.jpg, 003 - Retrieval Run.jpg, 004 - Singularity.jpg, 005 - Stimhack.jpg, 006 - Cyberfeeder.jpg, 007 - Spinal Modem.jpg, 008 - Darwin.jpg, 009 - Datasucker.jpg,
    010 - Force of Nature.jpg, 011 - Imp.jpg, 012 - Hemmorhage.jpg, 013 - Mimic.jpg, 014 - Morning Star.jpg, 015 - Ice Carver.jpg, 016 - Liberated Account.jpg, 017 - Scrubber.jpg, 018 - Xanadu.jpg,
    019 - Gabriel Santiago.jpg, 020 - Easy Mark.jpg, 021 - Emergency Shutdown.jpg, 022 - Forged Activation Orders.jpg, 023 - Inside Job.jpg, 024 - Special Order.jpg, 025 - Doppenganger.jpg,
    026 - HQ Interface.jpg, 027 - Aurora.jpg, 028 - Faerie.jpg, 029 - Femme Fatale.jpg, 030 - Peacock.jpg, 031 - Pheromones.jpg, 032 - Sneakdoor Beta.jpg, 033 - Bank Job.jpg, 034 - Crash Space.jpg,
    035 - Fall Guy.jpg, 036 - Mr. Li.jpg, 037 - Chaos Theory.jpg, 038 - Diesel.jpg, 039 - Indexing.jpg, 040 - Modded.jpg, 041 - Notoriety.jpg, 042 - Test Run.jpg, 043 - The Maker_s Eye.jpg,
    044 - Tinkering.jpg, 045 - Dinosaurus.jpg, 046 - Rabbit Hole.jpg, 047 - The Personal Touch.jpg, 048 - Battering Ram.jpg, 049 - Gordian Blade.jpg, 050 - Magnum Opus.jpg, 051 - Pipeline.jpg,
    052 - Aesop_s Pawnshop.jpg, 053 - All-Nighter.jpg, 054 - Sacrificial Construct.jpg, 055 - Infiltration.jpg, 056 - Sure Gamble.jpg, 057 - Dyson Mem Chip.jpg, 058 - Crypsis.jpg,
    059 - Armitage Codebusting.jpg, 060 - Underworld Contact.jpg, 061 - Haas-Bioroid Stronger Together.jpg, 062 - Project Ares.jpg, 063 - Project Vitruvius.jpg, 064 - Adonis Campaign.jpg,
    065 - Aggressive Secretary.jpg, 066 - Heimdall 1.0.jpg, 067 - Hudson 1.0.jpg, 068 - Ichi 1.0.jpg, 069 - Rototurret.jpg, 070 - Viktor 1.0.jpg, 071 - Archived Memories.jpg, 072 - Biotic Labor.jpg,
    073 - Green Level Clearance.jpg, 074 - Shipment from MirrorMorph.jpg, 075 - Ash 2X3ZB9CY.jpg, 076 - Strongbox.jpg, 077 - Jinteki - Personal Evolution.jpg, 078 - Braintrust.jpg, 079 - Nisei Mark II.jpg,
    080 - Project Junebug.jpg, 081 - Ronin.jpg, 082 - Snare!.jpg, 083 - Himitsu-Bako.jpg, 084 - Neural Katana.jpg, 085 - Swordsman.jpg, 086 - Wall of Thorns.jpg, 087 - Whirlpool.jpg, 088 - Yagura.jpg,
    089 - Celebrity Gift.jpg, 090 - Neural EMP.jpg, 091 - Trick of Light.jpg, 092 - Hokusai Grid.jpg, 093 - NBN - Making News.jpg, 094 - Project Beale.jpg, 095 - TGTBT.jpg, 096 - Ghost Branch.jpg,
    097 - Data Raven.jpg, 098 - Flare.jpg, 099 - Pop-Up Window.jpg, 100 - Tollbooth.jpg, 101 - Wraparound.jpg, 102 - Anonymous Tip.jpg, 103 - Closed Accounts.jpg, 104 - Psychographics.jpg,
    105 - SEA Source.jpg, 106 - Red Herrings.jpg, 107 - Bernice Mai.jpg, 108 - Weyland Consortium - Building a Better World.jpg, 109 - Hostile Takeover.jpg, 110 - Project Atlas.jpg, 111 - The Cleaners.jpg,
    112 - Dedicated Response Team.jpg, 113 - Elizabeth Mills.jpg, 114 - GRNDL Refinery.jpg, 115 - Archer.jpg, 116 - Caduceus.jpg, 117 - Hadrian_s Wall.jpg, 118 - Hive.jpg, 119 - Ice Wall.jpg,
    120 - Shadow.jpg, 121 - Beanstalk Royalties.jpg, 122 - Punitive Counterstrike.jpg, 123 - Shipment from Kaguya.jpg, 124 - False Lead.jpg, 125 - Priority Requisition.jpg, 126 - Private Security Force.jpg,
    127 - Melange Mining Corp.jpg, 128 - PAD Campaign.jpg, 129 - Enigma.jpg, 130 - Hunter.jpg, 131 - Wall of Static.jpg, 132 - Hedge Fund.jpg"
}

box_cards.each do |box_name, data|
  box = Box.where(name: box_name).take
  data.scan(/\d+.*?\.jpg,?/).each.each do |card|
    c = card.match(/(?<order>\d+[a-z]?)\s+-\s+(?<name>.*)\.jpg/).named_captures
    x = Card.create(order: c["order"].strip, name: c["name"].strip, box: box)
  end
end
