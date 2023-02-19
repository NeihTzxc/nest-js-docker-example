import { Column, Entity, Index } from "typeorm";

@Index("social_regions_pkey", ["id"], { unique: true })
@Entity("social_regions", { schema: "public" })
export class SocialRegions {
  @Column("integer", { primary: true, name: "id" })
  id: number;

  @Column("timestamp without time zone", {
    name: "created_at",
    nullable: true,
    default: () => "now()",
  })
  createdAt: Date | null;

  @Column("timestamp without time zone", {
    name: "updated_at",
    nullable: true,
    default: () => "now()",
  })
  updatedAt: Date | null;

  @Column("boolean", {
    name: "deleted_flg",
    nullable: true,
    default: () => "false",
  })
  deletedFlg: boolean | null;

  @Column("text", { name: "name", nullable: true })
  name: string | null;

  @Column("integer", { name: "type", nullable: true })
  type: number | null;

  @Column("integer", { name: "parent_id", nullable: true })
  parentId: number | null;

  @Column("text", { name: "slug", nullable: true })
  slug: string | null;
}
