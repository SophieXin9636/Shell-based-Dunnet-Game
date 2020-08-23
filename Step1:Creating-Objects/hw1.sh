mkdir PA1
cd PA1
mkdir inventory obj objects start

cd inventory 
echo -e "lamp" > lamp

cd ../objects
touch .alerts bear bin bins board boulder bracelet cabinet card coconuts coconut computer cpu emerald flashing food key lamp palm shovel steady tree trees vax
echo -e "The panel lights are steady and motionless.\nThe panel lights are flashing in a seemingly organized pattern.\nThere is a CPU card here.\nThere is a ferocious bear here!\nThere is a large boulder here.\nThere is a shiny brass key here.\nThere is a shovel here.\nThere is an emerald bracelet here.\nThere is some food here." > .alerts
echo -e "It looks like a grizzly to me." > bear
echo -e "All of the bins are empty.  Looking closely you can see that there are names written at the bottom of each bin, but most of them are faded away so that you cannot read them.  You can only make out three names:\n\t\t\t\t\tJeffrey Collier\n\t\t\t\t\tRobert Toukmond\n\t\t\t\t\tThomas Stock\n" > bin
cp bin bins
echo -e "The CPU board has a VAX chip on it.  It seems to have 2 Megabytes of RAM onboard." > board
cp board card
cp card cpu
echo -e "It is just a boulder.  It cannot be moved." > boulder
echo -e "I see nothing special about that." > bracelet
cp bracelet cabinet
cp bracelet coconut 
cp bracelet coconuts 
cp bracelet computer 
cp bracelet emerald 
cp bracelet key 
cp bracelet vax
echo -e "I don't know what that is." > flashing
cp flashing steady
echo -e "It looks like some kind of meat.  Smells pretty bad." > food
echo -e "The lamp is hand-crafted by Geppetto." > lamp
echo -e "They are palm trees with a bountiful supply of coconuts in them." > palm
cp palm tree
cp palm trees
echo -e "It is a normal shovel with a price tag attached that says \$19.99." > shovel

cd ../start
mkdir e
echo -e "Dead end\nYou are at a dead end of a dirt road.  The road goes to the east.\nIn the distance you can see that it will eventually fork off.  The trees here are very tall royal palms, and they are spaced equidistant from each other." > .d
touch 9
echo -e coconut > coconut
echo -e coconuts > coconuts
echo -e palm > palm
echo -e shovel > shovel
echo -e tree > tree
echo -e trees > trees
cp coconut coconuts palm tree trees ./e

cd e
mkdir e
echo -e "E/W Dirt road\nYou are on the continuation of a dirt road.  There are more trees on both sides of you.  The road continues to the east and west." > .d
ln -s .. w
touch 9
echo -e boulder > boulder

cd e
mkdir ne se
ln -s .. w
echo -e "Fork\nYou are at a fork of two passages, one to the northeast, and one to the southeast.  The ground here seems very soft. You can also go back west." > .d
touch 9
echo -e board > .board
cp .board .card
cp .board .cpu

cd se
mkdir se
ln -s .. nw
echo -e "SE/NW road\nYou are on a southeast/northwest road." > .d
touch 9
echo -e food > food

cd se
mkdir sw
ln -s .. nw
echo -e "Bear hangout\nYou are standing at the end of a road.  A passage leads back to the northwest." > .d
touch 9
echo -e "key" > .key
echo -e bear > bear

cd sw
ln -s .. ne
echo -e "Hidden area" > .d
touch 9
echo -e bracelet > bracelet
echo -e bracelet > emerald

cd ../../../ne
mkdir ne
ln -s .. sw
echo -e "NE/SW road\nYou are on a northeast/southwest road." > .d
touch 9

cd ne
mkdir ne

cd ne
mkdir e n w

cd e
ln -s .. w
echo -e "Mailroom\nYou are in a mailroom.  There are many bins where the mail is usually kept.  The exit is to the west." > .d
touch 9
echo -e bins > bin
echo -e bins > bins

cd ../w
ln -s .. e
echo -e "Computer room\nYou are in a computer room.  It seems like most of the equipment has been removed.  There is a VAX 11/780 in front of you, however, with one of the cabinets wide open.  A sign on the front of the machine says: This VAX is named ‘pokey’.  To type on the console, use the ‘type’ command.  The exit is to the east." > .d
touch 9
echo -e computer > computer
echo -e cabinet > cabinet
echo -e steady > steady
echo -e vax > vax
echo -e flashing > .flashing

cd ..
chmod 600 n
ln -s .. s
echo -e "Old Building hallway\nYou are in the hallway of an old building.  There are rooms to the east and west, and doors leading out to the north and south." > .d
touch 9

cd ..
chmod 600 ne
ln -s .. sw
echo -e "Building front\nYou are at the end of the road.  There is a building in front of you to the northeast, and the road leads back to the southwest." > .d
touch 9