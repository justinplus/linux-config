#
# Match colors for egrep, if supported
#

if command egrep --color=auto --help 1>/dev/null 2>/dev/null
	function egrep
		command egrep --color=auto $argv
	end
end

