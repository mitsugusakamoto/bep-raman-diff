;;; bep-setup.el --- ption: Setup of the BEP for convention

;;; $Id: bep-setup.el,v 1.3 2002/02/11 07:09:07 inoue Exp $
;;; $Author: inoue $
;;; Description:  Module to set up dtk voices and personalities
;;; Keywords: Voice, Personality, BEP
;;{{{  LCD Archive entry:

;;; LCD Archive Entry:
;;; emacspeak| T. V. Raman |raman@cs.cornell.edu
;;; A speech interface to Emacs |
;;; $Date: 2002/02/11 07:09:07 $ |
;;;  $Revision: 1.3 $ |
;;; Location undetermined
;;;

;;}}}
;;{{{  Copyright:
;;;Copyright (C) 1995 -- 2002, T. V. Raman 
;;; Copyright (c) 1994, 1995 by Digital Equipment Corporation.
;;; All Rights Reserved.
;;;
;;; This file is not part of GNU Emacs, but the same permissions apply.
;;;
;;; GNU Emacs is free software; you can redistribute it and/or modify
;;; it under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 2, or (at your option)
;;; any later version.
;;;
;;; GNU Emacs is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with GNU Emacs; see the file COPYING.  If not, write to
;;; the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.

;;}}}

;;; Commentary:

;;; This file is present for conventional setup for BEP users.
;;; This file call emacspeak-setup first, and setup some BEP-specific
;;; application settings.
;;; You can load BEP by simply loading this file.
;; 

;;; Code:

(defvar bep-setup-hook nil
  "hook variable called after the setup of BEP finished.")

;;; Set up Emacspeak first.
(load
 (concat (expand-file-name "emacspeak-setup"
			   (file-name-directory load-file-name))))

;;; Load Multilingual extension.
(setq emacspeak-m17n-auto-put-language-mode t)
(require 'emacspeak-m17n-setup)

;;; Japanese specific settings
(require 'emacspeak-m17n-ja)
(if (not emacspeak-m17n-put-language-strategy)
    (setq emacspeak-m17n-put-language-strategy
	  'emacspeak-m17n-put-language-ja-ke-1))

(if (not emacspeak-m17n-put-language-internal-strategy)
    (setq emacspeak-m17n-put-language-internal-strategy
	  'emacspeak-m17n-put-language-ja-ne))

;;; Do additional package setup.
(emacspeak-do-package-setup "egg" 'emacspeak-egg)
(emacspeak-do-package-setup "quail" 'emacspeak-kkc)
(emacspeak-do-package-setup "liece" 'emacspeak-liece)
(emacspeak-do-package-setup "mew" 'emacspeak-mew)
(emacspeak-do-package-setup "mime-setup" 'emacspeak-semi)
(emacspeak-do-package-setup "w3m" 'emacspeak-w3m)

;;; Define keys
(define-key 'emacspeak-personal-keymap "ms" 'emacspeak-m17n-ja-toggle-strategy)
(define-key 'emacspeak-personal-keymap "ma" 'emacspeak-m17n-auto-put-language-mode)

(run-hooks bep-setup-hook)

(provide 'bep-setup)
;;; bep-setup.el ends here
