const MAX_LINE_LENGTH: usize = 80;

/// Splits a string so that each line doesn't go over MAX_LINE_LENGTH
pub fn truncate_string(str: &str) -> Vec<String> {
    let mut string_parts = Vec::new();

    let mut length = 4;
    let mut line = String::new();

    let mut parts = str.split(" ").peekable();
    while let Some(part) = parts.next() {
        let fixed_part = &format!("{part} ");

        length += fixed_part.len();
        line.push_str(fixed_part);

        // Push string if we're over the threshold of at the end of the iterator
        if length >= MAX_LINE_LENGTH || parts.peek().is_none() {
            string_parts.push(line.clone());
            line.clear();
            length = 4;
        }
    }

    string_parts
}
