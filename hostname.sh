#!/usr/bin/env bash

colors=(
    "amaranth" "amber" "amethyst" "apricot" "aqua" "aquamarine" "asparagus" "auburn" 
    "azure" "beige" "bistre" "bittersweet" "blueberry" "burgundy" "byzantium" 
    "cerulean" "champagne" "chartreuse" "chocolate" "cinnamon" "copper" "cornflower" 
    "cream" "crimson" "denim" "emerald" "fuchsia" "garnet" "heliotrope" "indigo" 
    "ivory" "jade" "lavender" "lemon" "lilac" "lime" "mahogany" "malachite" "maroon" 
    "mauve" "mustard" "navy" "ochre" "olive" "onyx" "peach" "periwinkle" "plum" 
    "rose" "ruby" "saffron" "sapphire" "scarlet" "sepia" "silver" "tan" "taupe" 
    "teal" "topaz" "turquoise" "ultramarine" "vermilion" "violet" "viridian" "wine"
)

jobs=(
    "accountant" "actor" "administrator" "advisor" "analyst" "architect" "artist" 
    "astronaut" "baker" "barber" "biologist" "blacksmith" "builder" "butcher" 
    "carpenter" "cashier" "chef" "chemist" "clerk" "coach" "composer" "consultant" 
    "curator" "dancer" "dentist" "designer" "developer" "director" "driver" 
    "electrician" "engineer" "farmer" "firefighter" "gardener" "geologist" "guard" 
    "guide" "hairdresser" "healer" "instructor" "investigator" "janitor" "judge" 
    "lawyer" "librarian" "locksmith" "manager" "marketer" "masseur" "mechanic" 
    "medic" "miner" "musician" "nurse" "operator" "painter" "paralegal" "pathologist" 
    "pharmacist" "photographer" "pilot" "plumber" "poet" "policeman" "programmer" 
    "psychologist" "publisher" "receptionist" "reporter" "researcher" "sailor" 
    "scientist" "sculptor" "secretary" "shepherd" "singer" "smith" "soldier" 
    "statistician" "student" "surgeon" "tailor" "teacher" "technician" "therapist" 
    "translator" "veterinarian" "waiter" "welder" "writer"
)

get_random_color() {
    echo "${colors[$RANDOM % ${#colors[@]}]}"
}

get_random_job() {
    echo "${jobs[$RANDOM % ${#jobs[@]}]}"
}

random_color=$(get_random_color)
random_job=$(get_random_job)

echo "${random_color}-${random_job}"
