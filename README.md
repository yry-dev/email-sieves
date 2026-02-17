# email-sieves
My email sieves for doing more advanced filtering

## Repository Structure

- `sieves/` - Directory containing individual sieve script files
- `combine-sieves.sh` - Bash script for combining multiple sieve scripts into one file

## Usage

### Adding Sieve Scripts

Place your individual sieve script files (`.sieve` extension) in the `sieves/` directory. You can organize them with numbered prefixes (e.g., `01-newsletters.sieve`, `02-social.sieve`) to control the order they appear in the combined output.

### Combining Sieve Scripts

Run the `combine-sieves.sh` script to combine all sieve files:

```bash
./combine-sieves.sh
```

This will create a `combined.sieve` file with all your sieve scripts merged together.

#### Options

- `-d <directory>` - Specify a custom directory containing sieve scripts (default: `sieves`)
- `-o <output_file>` - Specify a custom output file (default: `combined.sieve`)
- `-h` - Display help information

#### Examples

```bash
# Combine with default settings
./combine-sieves.sh

# Use custom output file
./combine-sieves.sh -o my-filters.sieve

# Use custom sieves directory
./combine-sieves.sh -d my-sieves -o output.sieve
```

## About Sieve

Sieve is a scripting language for filtering email messages. It's commonly used with mail servers like Dovecot and Cyrus IMAP. For more information about Sieve syntax, see [RFC 5228](https://tools.ietf.org/html/rfc5228).
