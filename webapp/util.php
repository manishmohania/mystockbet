  <?php
 //str_starts_with
 if(!function_exists('str_starts_with')) {
     function str_starts_with($haystack,$needle) {
         //str_starts_with(string $haystack, string $needle): bool

         $strlen_needle = mb_strlen($needle);
         if(mb_substr($haystack,0,$strlen_needle)==$needle) {
             return true;
         }
         return false;
     }
 }
 
 //str_ends_with
  if(!function_exists('str_ends_with')) {
     //str_ends_with(string $haystack, string $needle): bool
     function str_ends_with($haystack,$needle) {
         //str_starts_with(string $haystack, string $needle): bool

         $strlen_needle = mb_strlen($needle);
         if(mb_substr($haystack,-$strlen_needle,$strlen_needle)==$needle) {
             return true;
         }
         return false;
     }
 }
?>
