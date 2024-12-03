# Git setup script

echo ""
echo "Starting git setup..."

# Display SSH key warning
echo "WARNING: not checking for existing SSH keys\!"

# Use current branch only when doing git push
echo "Setting push branch to be current branch by default."
git config --global push.default current

# Set git username
echo ""
echo "What’s your git name?"
read GIT_SETUP_NAME
git config --global user.name $GIT_SETUP_NAME

# Set git email
echo ""
echo "What’s your git email?"
read GIT_SETUP_EMAIL
git config --global user.email $GIT_SETUP_EMAIL

# Configure SSH keys
echo ""
echo "Configuring SSH keys..."
ssh-keygen -t rsa -C $GIT_SETUP_EMAIL

echo "Starting the SSH agent..."
eval "$(ssh-agent -s)"

echo "Adding SSH key to ~/.ssh/id_rsa..."
ssh-add ~/.ssh/id_rsa

echo "SSH key copied to clipboard."
pbcopy < ~/.ssh/id_rsa.pub

# Use the patience algorithm for diffing
echo ""
echo "Setting git diff defaults."
git config --global diff.algorithm patience
git config --global diff.colorMoved default

echo ""
echo "All done with git setup!"
