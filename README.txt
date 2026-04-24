kratos_common scope

- This directory is the default shared protobuf and contract source for cross-service interfaces in this workspace.
- Services should prefer kratos_common contracts unless a repository-local exception is explicitly documented.
- Current documented exception: `asset_management_pvk_storage/api/storage/v1/storage.proto`.
- The `pvk_storage` contract stays repo-local because it is tied to key-custody and internal JWT authorization boundaries.
- `asset_management_server` and `asset_management_ledger` may temporarily keep repo-local `storage.proto` copies for `pvk_storage`, but those copies are compatibility mirrors, not canonical sources.
- If a `pvk_storage` proto changes, the mirror copies in `asset_management_server` and `asset_management_ledger` must be updated in the same reviewed change.
