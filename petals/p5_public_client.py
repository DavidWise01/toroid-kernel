"""Petals P5: public-swarm client configuration.

This is a configuration and validation layer. It does not start a server or
donate local GPU capacity. A real client still requires the Petals package and
the selected model's access requirements.
"""

from dataclasses import dataclass


@dataclass(frozen=True)
class PublicPetalsClient:
    model_id: str
    public_swarm: bool
    serve_local_gpu: bool = False


def validate_client(client: PublicPetalsClient) -> bool:
    """Require a named model and public routing without local serving."""
    return bool(client.model_id) and client.public_swarm and not client.serve_local_gpu


def main() -> None:
    client = PublicPetalsClient(
        model_id="meta-llama/Meta-Llama-3.1-70B-Instruct",
        public_swarm=True,
        serve_local_gpu=False,
    )
    assert validate_client(client)
    print("Petals P5 public client: PASS")


if __name__ == "__main__":
    main()
