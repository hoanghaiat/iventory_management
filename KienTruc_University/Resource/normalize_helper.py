def normalize_text(text):
import unicodedata


class NormalizeHelper:
    def normalize_text(self, text):
        """
        Loại bỏ dấu tiếng Việt, chuyển về chữ thường, loại bỏ khoảng trắng đầu cuối.
        """
        if not isinstance(text, str):
            text = str(text)
        norm = ''.join([c for c in unicodedata.normalize('NFKD', text) if not unicodedata.combining(c)])
        return norm.lower().strip()
