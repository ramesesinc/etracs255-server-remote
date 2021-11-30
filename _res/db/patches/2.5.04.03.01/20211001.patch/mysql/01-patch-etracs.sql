-- ## 2021-10-01

INSERT IGNORE INTO `sys_var` (`name`, `value`, `description`, `datatype`, `category`) 
VALUES ('cashbook_report_allow_multiple_fund_selection', '0', 'Cashbook Report: Allow Multiple Fund Selection', 'checkbox', 'TC');

INSERT IGNORE INTO `sys_var` (`name`, `value`, `description`, `datatype`, `category`) 
VALUES ('liquidate_remittance_as_of_date', '1', 'Liquidate Remittances as of Date', 'checkbox', 'TC');

INSERT IGNORE INTO `sys_var` (`name`, `value`, `description`, `datatype`, `category`) 
VALUES ('cashreceipt_reprint_requires_approval', 'false', 'CashReceipt Reprinting Requires Approval', 'checkbox', 'TC');

INSERT IGNORE INTO `sys_var` (`name`, `value`, `description`, `datatype`, `category`) 
VALUES ('cashreceipt_void_requires_approval', 'true', 'CashReceipt Void Requires Approval', 'checkbox', 'TC');

INSERT IGNORE INTO `sys_var` (`name`, `value`, `description`, `datatype`, `category`) 
VALUES ('deposit_collection_by_bank_account', '0', 'Deposit collection by bank account instead of by fund', 'checkbox', 'TC');
