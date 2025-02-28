{-# LANGUAGE ForeignFunctionInterface, MagicHash #-}
module SG.FFI where

import Foreign
import Foreign.C
import PGF2.FFI
import GHC.Ptr
import Data.Int

data SgSG
data SgTripleResult
type SgId = Int64

foreign import ccall "sg/sg.h sg_open"
  sg_open :: CString -> Ptr GuExn -> IO (Ptr SgSG)

foreign import ccall "sg/sg.h sg_close"
  sg_close :: Ptr SgSG -> Ptr GuExn -> IO ()

foreign import ccall "sg/sg.h sg_begin_trans"
  sg_begin_trans :: Ptr SgSG -> Ptr GuExn -> IO ()

foreign import ccall "sg/sg.h sg_commit"
  sg_commit :: Ptr SgSG -> Ptr GuExn -> IO ()

foreign import ccall "sg/sg.h sg_rollback"
  sg_rollback :: Ptr SgSG -> Ptr GuExn -> IO ()

foreign import ccall "sg/sg.h sg_insert_expr"
  sg_insert_expr :: Ptr SgSG -> PgfExpr -> Ptr GuExn -> IO SgId

foreign import ccall "sg/sg.h sg_get_expr"
  sg_get_expr :: Ptr SgSG -> SgId -> Ptr GuPool -> Ptr GuExn -> IO PgfExpr

foreign import ccall "sg/sg.h sg_update_fts_index"
  sg_update_fts_index :: Ptr SgSG -> Ptr PgfPGF -> Ptr GuExn -> IO ()

foreign import ccall "sg/sg.h sg_query_linearization"
  sg_query_linearization :: Ptr SgSG -> CString -> Ptr GuPool -> Ptr GuExn -> IO (Ptr GuSeq)

foreign import ccall "sg/sg.h sg_insert_triple"
  sg_insert_triple :: Ptr SgSG -> SgTriple -> Ptr GuExn -> IO SgId

foreign import ccall "sg/sg.h sg_get_triple"
  sg_get_triple :: Ptr SgSG -> SgId -> SgTriple -> Ptr GuPool -> Ptr GuExn -> IO CInt

foreign import ccall "sg/sg.h sg_query_triple"
  sg_query_triple :: Ptr SgSG -> SgTriple -> Ptr GuExn -> IO (Ptr SgTripleResult)

foreign import ccall "sg/sg.h sg_triple_result_fetch"
  sg_triple_result_fetch :: Ptr SgTripleResult -> Ptr SgId -> SgTriple -> Ptr GuPool -> Ptr GuExn -> IO CInt

foreign import ccall "sg/sg.h sg_triple_result_close"
  sg_triple_result_close :: Ptr SgTripleResult -> Ptr GuExn -> IO ()


type SgTriple = Ptr PgfExpr

withTriple :: (SgTriple -> IO a) -> IO a
withTriple = allocaArray 3

gu_exn_type_SgError = Ptr "SgError"# :: CString
