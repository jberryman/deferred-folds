module DeferredFolds.Util.TextArray
where

import DeferredFolds.Prelude hiding (Array)
import Data.Text.Array
import qualified Data.Text.Internal as TextInternal
import qualified Data.Text.Internal.Encoding.Utf16 as TextUtf16
import qualified Data.Text.Internal.Unsafe.Char as TextChar
import qualified Data.Text.Unsafe as T

{-|
Same as 'Data.Text.Unsafe.iter',
but operates on the array directly,
uses a continuation and passes the next offset to it instead of delta.
-}
{-# INLINE iter #-}
iter :: Array -> Int -> (Char -> Int -> a) -> a
iter arr offset cont =
    case T.iterArray arr offset of
      T.Iter chr l -> cont chr (offset+l)
