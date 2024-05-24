# Run ssh-agent once
#  [!] Do not run this on a multi-user system.

if test -e $HOME/.ssh/id_ed25519
    if test -z (pgrep ssh-agent)
        eval (ssh-agent -c)
        set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
        set -Ux SSH_AGENT_PID $SSH_AGENT_PID
    end
end
