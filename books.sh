cd ~/alu-shell/loops_conditions_and_parsing && \
# --- Task 0: For Best School ---
cat << 'EOF' > 1-for_best_school
#!/usr/bin/env bash
# This script is displaying "Best School" 10 times
for i in {1..10}
do
    echo "Best School"
done
EOF
chmod +x 1-for_best_school && \
# --- Task 1: While Best School ---
cat << 'EOF' > 2-while_best_school
#!/usr/bin/env bash
# This script is displaying "Best School" 10 times
i=1
while [ $i -le 10 ]
do
    echo "Best School"
    i=$((i + 1))
done
EOF
chmod +x 2-while_best_school && \
# --- Task 2: Until Best School ---
cat << 'EOF' > 3-until_best_school
#!/usr/bin/env bash
# This script is displaying "Best School" 10 times
i=1
until [ $i -gt 10 ]
do
    echo "Best School"
    i=$((i + 1))
done
EOF
chmod +x 3-until_best_school && \
# --- Task 3: If 9, say Hi! ---
cat << 'EOF' > 4-if_9_say_hi
#!/usr/bin/env bash
# This script loops 10 times and says Hi on the 9th iteration
i=1
while [ $i -le 10 ]
do
    echo "Best School"
    if [ $i -eq 9 ]
    then
        echo "Hi"
    fi
    i=$((i + 1))
done
EOF
chmod +x 4-if_9_say_hi && \
# --- Task 4: 4 bad luck, 8 is your chance ---
cat << 'EOF' > 5-4_bad_luck_8_is_your_chance
#!/usr/bin/env bash
# Loops from 1 to 10 with condition messages
i=1
while [ $i -le 10 ]
do
    if [ $i -eq 4 ]
    then
        echo "bad luck"
    elif [ $i -eq 8 ]
    then
        echo "good luck"
    else
        echo "Best School"
    fi
    i=$((i + 1))
done
EOF
chmod +x 5-4_bad_luck_8_is_your_chance && \
# --- Task 5: Superstitious numbers ---
cat << 'EOF' > 6-superstitious_numbers
#!/usr/bin/env bash
# Loops 1 to 20 displaying bad luck exceptions using case
i=1
while [ $i -le 20 ]
do
    case $i in
        4)
            echo "4"
            echo "bad luck from China"
            ;;
        9)
            echo "9"
            echo "bad luck from Japan"
            ;;
        17)
            echo "17"
            echo "bad luck from Italy"
            ;;
        *)
            echo "$i"
            ;;
    esac
    i=$((i + 1))
done
EOF
chmod +x 6-superstitious_numbers && \
# --- Task 6: Clock ---
cat << 'EOF' > 7-clock
#!/usr/bin/env bash
# Displays time for 12 hours and 59 minutes
h=0
while [ $h -le 12 ]
do
    echo "Hour: $h"
    m=1
    while [ $m -le 59 ]
    do
        echo "$m"
        m=$((m + 1))
    done
    h=$((h + 1))
done
EOF
chmod +x 7-clock && \
# --- Task 7: For ls ---
cat << 'EOF' > 8-for_ls
#!/usr/bin/env bash
# Displays current directory list showing only part after first dash
for file in *
do
    if [ -f "$file" ]; then
        echo "$file" | cut -d'-' -f2-
    fi
done
EOF
chmod +x 8-for_ls && \
# --- Task 8: To file, or not to file ---
cat << 'EOF' > 9-to_file_or_not_to_file
#!/usr/bin/env bash
# Gives information about a specific file passed via command line or defaults to school
FILE=${1:-school}
if [ -e "$FILE" ]
then
    echo "$FILE file exists"
    if [ -s "$FILE" ]
    then
        echo "$FILE file is not empty"
    else
        echo "$FILE file is empty"
    fi
    if [ -f "$FILE" ]
    then
        echo "$FILE is a regular file"
    fi
else
    echo "$FILE file does not exist"
fi
EOF
chmod +x 9-to_file_or_not_to_file && \
# --- Task 9: FizzBuzz ---
cat << 'EOF' > 10-fizzbuzz
#!/usr/bin/env bash
# FizzBuzz script 1 to 100
i=1
while [ $i -le 100 ]
do
    if [ $((i % 3)) -eq 0 ] && [ $((i % 5)) -eq 0 ]
    then
        echo "FizzBuzz"
    elif [ $((i % 3)) -eq 0 ]
    then
        echo "Fizz"
    elif [ $((i % 5)) -eq 0 ]
    then
        echo "Buzz"
    else
        echo "$i"
    fi
    i=$((i + 1))
done
EOF
chmod +x 10-fizzbuzz && \
# --- Task 10: Read and cut ---
cat << 'EOF' > 11-read_and_cut
#!/usr/bin/env bash
# Displays username, user id, and home directory from /etc/passwd
while IFS=: read -r user pass uid gid info home shell || [ -n "$user" ]
do
    echo "${user}:${uid}:${home}"
done < /etc/passwd
EOF
chmod +x 11-read_and_cut && \
# --- Task 11: Tell the story of passwd ---
cat << 'EOF' > 12-tell_the_story_of_passwd
#!/usr/bin/env bash
# Displays content of /etc/passwd in a story format
while IFS=: read -r user pass uid gid info home shell || [ -n "$user" ]
do
    echo "The user ${user} is part of the ${gid} gang, lives in ${home} and rides ${shell}. ${uid}'s place is protected by the passcode ${pass}, more info about the user here: ${info}"
done < /etc/passwd
EOF
chmod +x 12-tell_the_story_of_passwd && \
# --- Task 12: Let's parse Apache logs ---
cat << 'EOF' > 13-lets_parse_apache_logs
#!/usr/bin/env bash
# Displays visitor IP and HTTP status code using awk
awk '{print $1, $9}' apache-access.log
EOF
chmod +x 13-lets_parse_apache_logs && \
# --- Task 13: Dig the data ---
cat << 'EOF' > 14-dig_the-data
#!/usr/bin/env bash
# Groups visitors by IP and HTTP status code, sorted by occurrence
awk '{print $1, $9}' apache-access.log | sort | uniq -c | sort -nr
EOF
chmod +x 14-dig_the-data && \
# --- Git Deployment Stage ---
git add . && \
git commit -m "feat: complete shell assignment matching strict autograder format specs" && \
git push origin main
