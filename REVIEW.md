# Dotfiles Repository Review

## Critical Issues (Must Fix)

### 1. **Path Handling Inconsistencies**

- **Issue**: `bootstrap.sh` uses relative paths (`./install/...`) but scripts use absolute paths (`${HOME}/Projects/dotfiles/...`)
- **Problem**: Scripts will fail if not run from the correct directory
- **Location**: `bootstrap.sh`, all install scripts
- **Fix**: Use `SCRIPT_DIR` variable to determine script location dynamically

### 2. **Brewfile Path Issue**

- **Issue**: `install/brew.sh` line 13 uses `~/Projects/dotfiles/applications/brew/Brewfile` with tilde
- **Problem**: Tilde expansion doesn't work in quoted strings, will fail
- **Location**: `install/brew.sh:13`
- **Fix**: Use `${HOME}` or unquoted path, or better yet, use `SCRIPT_DIR`

### 3. **Missing Prerequisites Check**

- **Issue**: No check if Homebrew is already installed before attempting installation
- **Problem**: Will fail or prompt unnecessarily if Homebrew exists
- **Location**: `install/brew-install.sh`
- **Fix**: Check `command -v brew` before installing

### 4. **Oh-My-Zsh Installation Issues**

- **Issue**:
  - Uses deprecated `master` branch (should be `main`)
  - No check if already installed
  - Will overwrite existing `.zshrc` without backup
- **Location**: `install/oh-my-zsh.sh`
- **Fix**: Check for existing installation, use `main` branch, handle existing `.zshrc`

### 5. **Missing Dependencies in .zshrc**

- **Issue**: `.zshrc` references tools not in Brewfile:
  - `fzf` (line 84)
  - `bun` (lines 90, 93-94)
  - `volta` (line 104)
- **Problem**: Scripts will fail if these aren't installed
- **Location**: `dotfiles/.zshrc`
- **Fix**: Add to Brewfile or add conditional checks

### 6. **Hardcoded User Paths**

- **Issue**: `.zshrc` contains hardcoded user-specific paths:
  - Line 90: `/Users/anton.efimov/.bun/_bun`
  - Line 104: `/Users/anton.efimov/.volta/bin`
- **Problem**: Won't work for other users
- **Location**: `dotfiles/.zshrc`
- **Fix**: Use `${HOME}` variable

### 7. **Missing Oh-My-Zsh Source**

- **Issue**: `.zshrc` doesn't source oh-my-zsh configuration
- **Problem**: Oh-my-zsh won't be initialized
- **Location**: `dotfiles/.zshrc`
- **Fix**: Add `source $ZSH/oh-my-zsh.sh` or proper oh-my-zsh initialization

### 8. **Array Expansion Bug**

- **Issue**: `dotfiles.sh` uses `${files[@]}` without proper quoting
- **Problem**: Will fail with filenames containing spaces
- **Location**: `install/dotfiles.sh:20`
- **Fix**: Use proper array iteration: `for file in "${files[@]}"`

### 9. **Missing Error Handling**

- **Issue**: No checks if directories exist before operations
- **Problem**: Scripts will fail with unclear errors
- **Location**: All install scripts
- **Fix**: Add directory existence checks

### 10. **Homebrew Installation URL**

- **Issue**: Uses deprecated `master` branch in URL
- **Problem**: May break if GitHub removes master branch
- **Location**: `install/brew-install.sh:9`
- **Fix**: Use `HEAD` or `main` branch

### 10a. **VS Code Script Logic Errors**

- **Issue**: Multiple logic errors in `.vscode` preference script:
  - Lines 30-31, 39-40, 47-48, 57-58, 68-69: Creates symlink even if source doesn't exist
  - Line 62: Uses hardcoded path with tilde (`~/Projects/...`)
  - Line 64: Typo "porjects" instead of "projects"
  - No check if VS Code User directory exists before symlinking
- **Problem**: Script will fail or create broken symlinks
- **Location**: `install/preferences/.vscode`
- **Fix**: Fix conditional logic, use `${HOME}`, create directory if needed, fix typo

### 10b. **Karabiner Script Wildcard Bug**

- **Issue**: Line 10 uses wildcard in variable assignment: `source=$HOME/Projects/dotfiles/applications/karabiner/*`
- **Problem**: Wildcard won't expand in variable assignment, will fail
- **Location**: `install/preferences/.karabiner:10`
- **Fix**: Use proper directory path or loop through files

## Important Issues (Should Fix)

### 11. **No macOS Version Check**

- **Issue**: No validation that script is running on macOS
- **Problem**: Could accidentally run on wrong OS
- **Fix**: Add `[[ "$OSTYPE" == "darwin"* ]]` check

### 12. **Missing Script Safety Flags**

- **Issue**: Scripts use `set -o errexit` but missing:
  - `set -o pipefail` (catch errors in pipes)
  - `set -o nounset` (catch unset variables)
- **Location**: All install scripts
- **Fix**: Add both flags

### 13. **No Idempotency**

- **Issue**: Scripts can't be safely run multiple times
- **Problem**: May create duplicate symlinks, reinstall packages, etc.
- **Fix**: Add checks before operations (e.g., check if symlink exists)

### 14. **Empty Preferences Directory**

- **Issue**: `install/preferences/` has files but `applications.sh` looks for dotfiles (`.filename`)
- **Problem**: Preference scripts won't be sourced
- **Location**: `install/applications.sh`
- **Fix**: Align file naming or fix the find command

### 15. **No Backup Before Overwriting**

- **Issue**: Some operations overwrite files without backup
- **Problem**: Data loss risk
- **Location**: Various scripts (especially preference scripts)
- **Fix**: Always backup before overwriting

### 15a. **Missing Directory Creation**

- **Issue**: Preference scripts don't create target directories if they don't exist
- **Problem**: Symlink creation will fail (e.g., VS Code User directory, Karabiner config directory)
- **Location**: All preference scripts
- **Fix**: Add `mkdir -p` before symlinking

### 16. **SSH Key Handling**

- **Issue**: `.zshrc` tries to add all SSH keys without checking if they're already added
- **Problem**: May cause errors or duplicate key entries
- **Location**: `dotfiles/.zshrc:29-33`
- **Fix**: Check if key is already loaded before adding

### 17. **Git Installation Check**

- **Issue**: README mentions git but no check in scripts
- **Problem**: Scripts may fail if git isn't installed
- **Fix**: Add git check or install Xcode command line tools

### 18. **No Logging**

- **Issue**: No log file for troubleshooting failed installations
- **Problem**: Hard to debug issues
- **Fix**: Add logging to file

## Gaps (Missing Features)

### 19. **No Dry-Run Mode**

- **Gap**: Can't preview what will happen without executing
- **Suggestion**: Add `--dry-run` flag

### 20. **No Rollback Mechanism**

- **Gap**: Can't undo changes if something goes wrong
- **Suggestion**: Create backup manifest and restore script

### 21. **No Validation Script**

- **Gap**: No way to verify installation was successful
- **Suggestion**: Add validation script that checks all components

### 22. **No Update Mechanism**

- **Gap**: README mentions update but no automated way
- **Suggestion**: Add `update.sh` script

### 23. **Missing System Preferences**

- **Gap**: No macOS system preferences configuration
- **Suggestion**: Add `defaults write` commands for common macOS settings

### 24. **No Xcode Command Line Tools Check**

- **Gap**: Assumes Xcode CLI tools are installed
- **Suggestion**: Add check and installation

### 25. **No Shell Detection**

- **Gap**: Assumes bash is available
- **Suggestion**: Check shell compatibility

### 26. **Missing Application Configurations**

- **Gap**: Some apps have configs but no installation/symlink script:
  - Karabiner configs exist but no installation
  - Raycast config exists but no installation
  - VS Code settings exist but no installation
- **Suggestion**: Add installation steps for all app configs

### 27. **No Health Check**

- **Gap**: No script to verify all symlinks are valid
- **Suggestion**: Add health check script

## Suggestions for Improvement

### 28. **Use Consistent Path Resolution**

- **Suggestion**: Create a common function to get script directory:
  ```bash
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  ```

### 29. **Add Progress Indicators**

- **Suggestion**: Show progress for long-running operations (brew install)

### 30. **Add Color Output**

- **Suggestion**: Use colors for success/error messages

### 31. **Add Confirmation Prompts**

- **Suggestion**: Ask before destructive operations (like `dotfiles.sh` does)

### 32. **Version Pinning**

- **Suggestion**: Consider pinning versions in Brewfile for reproducibility

### 33. **Separate User-Specific Config**

- **Suggestion**: Move user-specific paths to a separate file that's gitignored

### 34. **Add CI/CD Validation**

- **Suggestion**: Add GitHub Actions to test scripts on macOS

### 35. **Documentation**

- **Suggestion**:
  - Document what each script does
  - Add troubleshooting section
  - Document prerequisites

### 36. **Modular Design**

- **Suggestion**: Make scripts more modular, allow selective installation

### 37. **Add Starship Config Installation**

- **Suggestion**: Starship config exists but no installation script

### 38. **Handle Existing Symlinks**

- **Suggestion**: `dotfiles.sh` should handle case where symlink already points to correct location

### 39. **Add Retry Logic**

- **Suggestion**: For network operations (brew, git clones), add retry logic

### 40. **Check Disk Space**

- **Suggestion**: Verify sufficient disk space before installation

## Priority Recommendations

### High Priority (Fix Immediately)

1. Fix path handling (issues #1, #2)
2. Add prerequisite checks (#3, #17)
3. Fix hardcoded paths (#6)
4. Add missing dependencies (#5)
5. Fix array expansion (#8)
6. Add oh-my-zsh source (#7)
7. Fix VS Code script logic errors (#10a)
8. Fix Karabiner wildcard bug (#10b)
9. Add directory creation checks (#15a)

### Medium Priority (Fix Soon)

10. Add error handling (#9, #12)
11. Fix oh-my-zsh installation (#4)
12. Add macOS check (#11)
13. Fix preferences directory issue (#14)
14. Add idempotency (#13)

### Low Priority (Nice to Have)

12. Add logging (#18)
13. Add dry-run mode (#19)
14. Add validation script (#21)
15. Add system preferences (#23)
16. Improve documentation (#35)

## Testing Recommendations

1. **Test on fresh macOS installation**
2. **Test with existing Homebrew installation**
3. **Test with existing oh-my-zsh installation**
4. **Test with existing dotfiles**
5. **Test with different user names**
6. **Test with spaces in paths**
7. **Test interruption and resume**
8. **Test on different macOS versions**
